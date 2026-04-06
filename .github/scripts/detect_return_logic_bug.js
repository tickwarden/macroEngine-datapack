// .github/scripts/detect-return-logic.js
// Return ile ilgili logic bug'ları otomatik tespit eder

module.exports = async ({ github, context }) => {
  const issue = context.payload.issue;
  if (!issue) return;

  const body = (issue.body || "").toLowerCase();
  const title = (issue.title || "").toLowerCase();
  const text = title + "\n" + body;

  // Sadece kelime olarak "return" varsa devam et (false positive azaltmak için)
  if (!/\breturn\b/.test(text)) return;

  let warnings = [];

  if (/\b(loop|tick|update|frame)\b/.test(text)) {
    warnings.push("Loop / tick / update içinde `return` kullanımı");
  }
  if (/\b(not working|doesn't stop|not stopping|stuck|hang|broken)\b/.test(text)) {
    warnings.push("`return` çalışmıyor veya fonksiyon durmuyor olabilir");
  }
  if (/\b(infinite|endless|freeze|crash|hang|deadlock|forever)\b/.test(text)) {
    warnings.push("Infinite loop veya donma (freeze) riski yüksek");
  }
  if (/\b(macro|chain|callback|async|promise)\b/.test(text)) {
    warnings.push("Macro, chain, async veya callback ile `return` kombinasyonu");
  }

  // Label ekle
  await github.rest.issues.addLabels({
    owner: context.repo.owner,
    repo: context.repo.repo,
    issue_number: issue.number,
    labels: ["logic"]
  });

  // Uyarı listesi
  const warningList = warnings.length > 0
    ? warnings.map(w => `- ${w}`).join("\n")
    : "- Genel `return` kullanımı tespit edildi (mantık hatası şüphesi)";

  // Yorum bırak
  await github.rest.issues.createComment({
    owner: context.repo.owner,
    repo: context.repo.repo,
    issue_number: issue.number,
    body: `🧠 **Logic Bug Detection (return)**

Bu issue'da \`return\` kelimesi tespit edildi. Özellikle oyun, macro, tick veya update tabanlı sistemlerde yanlış \`return\` kullanımı sıkça logic bug'a neden olur.

**Olası problemler:**
${warningList}

💡 **Önemli Notlar:**
- \`return\` yanlış yerde kullanılırsa fonksiyon erken biter, alttaki kodlar çalışmaz.
- Tick / update / loop içinde \`return\` koymak **infinite loop** veya donmaya yol açabilir.
- Macro + return + async kombinasyonları ekstra dikkat gerektirir.

👉 Lütfen mümkünse **minimal reproducible test case** ekleyin. Bu, sorunu daha hızlı anlamamıza yardımcı olur.

Eğer bu tespit yanlış pozitif ise, lütfen buraya yorum yazın.`
  });
};

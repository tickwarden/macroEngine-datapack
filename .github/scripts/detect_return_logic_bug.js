// .github/scripts/detect-return-logic.js
// Datapack reposu için return + tick/macro logic bug detector

module.exports = async ({ github, context }) => {
  const issue = context.payload.issue;
  if (!issue) return;

  const body = (issue.body || "").toLowerCase();
  const title = (issue.title || "").toLowerCase();
  const text = title + "\n" + body;

  // Kelime olarak "return" varsa devam et
  if (!/\breturn\b/.test(text)) return;

  let warnings = [];

  if (/\b(tick|loop|update|function|command|schedule)\b/.test(text)) {
    warnings.push("Tick / loop / update / schedule içinde `return` kullanımı");
  }
  if (/\b(not working|doesn't work|not stopping|stuck|hang|broken|donuyor)\b/.test(text)) {
    warnings.push("`return` çalışmıyor veya fonksiyon durmuyor olabilir");
  }
  if (/\b(infinite|endless|freeze|crash|hang|deadlock|forever|donma)\b/.test(text)) {
    warnings.push("Infinite loop veya donma (freeze) riski yüksek");
  }
  if (/\b(macro|chain|callback|async|execute|run)\b/.test(text)) {
    warnings.push("Macro, chain veya execute ile `return` kombinasyonu");
  }

  // Label ekle
  await github.rest.issues.addLabels({
    owner: context.repo.owner,
    repo: context.repo.repo,
    issue_number: issue.number,
    labels: ["logic"]
  });

  const warningList = warnings.length > 0
    ? warnings.map(w => `- ${w}`).join("\n")
    : "- Genel `return` kullanımı tespit edildi (mantık hatası şüphesi)";

  await github.rest.issues.createComment({
    owner: context.repo.owner,
    repo: context.repo.repo,
    issue_number: issue.number,
    body: `🧠 **Logic Bug Detection (return)** - Datapack

Bu issue'da \`return\` kelimesi tespit edildi. Datapack'lerde tick, schedule, loop veya macro ile yanlış \`return\` kullanımı çok sık logic bug yaratır.

**Olası problemler:**
${warningList}

💡 **Önemli Notlar:**
- \`return\` yanlış yerde kullanılırsa fonksiyon erken biter, alttaki kodlar çalışmaz.
- Tick / loop / schedule içinde \`return\` koymak **infinite loop** veya donmaya neden olabilir.
- Macro + return + execute kombinasyonları ekstra dikkat ister.

👉 Lütfen mümkünse **küçük bir test datapack** (minimal reproducible example) ekleyin.

Eğer bu tespit yanlış pozitif ise, lütfen buraya yorum yazın.`
  });
};

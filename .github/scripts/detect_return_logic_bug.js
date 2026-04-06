// Detect return-related logic bugs in issues

module.exports = async ({ github, context }) => {
  const issue = context.payload.issue;
  const body = (issue.body || "").toLowerCase();
  const title = (issue.title || "").toLowerCase();

  // return keyword check
  const hasReturn = body.includes("return") || title.includes("return");

  if (!hasReturn) return;

  let warnings = [];

  // ⚠️ Şüpheli kullanım patternleri
  if (body.includes("loop") || body.includes("tick")) {
    warnings.push("return ile loop/tick ilişkili olabilir");
  }

  if (body.includes("not working") || body.includes("doesn't stop")) {
    warnings.push("return çalışmıyor olabilir");
  }

  if (body.includes("infinite") || body.includes("freeze")) {
    warnings.push("infinite loop riski");
  }

  // 🏷️ Label ekle
  await github.rest.issues.addLabels({
    owner: context.repo.owner,
    repo: context.repo.repo,
    issue_number: issue.number,
    labels: ["logic"]
  });

  // 💬 Yorum bırak
  await github.rest.issues.createComment({
    owner: context.repo.owner,
    repo: context.repo.repo,
    issue_number: issue.number,
    body: `🧠 **Logic Bug Detection (return)**

Bu issue'da \`return\` kullanımı tespit edildi.

Olası problemler:
${warnings.map(w => `- ${w}`).join("\n") || "- Genel return misuse ihtimali"}

💡 Not:
- \`return\` yanlış yerde kullanılırsa function durmaz
- tick chain içinde yanlış kullanım infinite loop yapabilir
- macro + return kombinasyonu ekstra dikkat ister

👉 Gerekirse minimal test case ekle.`
  });
};

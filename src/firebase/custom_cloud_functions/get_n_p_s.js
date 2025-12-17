const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.getNPS = functions.https.onCall(async () => {
  const snapshot = await admin.firestore().collection("nps_responses").get();
  const scores = snapshot.docs.map((doc) => doc.data().score);

  const promoters = scores.filter((s) => s >= 9).length;
  const detractors = scores.filter((s) => s <= 6).length;
  const total = scores.length;
  const nps = total > 0 ? ((promoters - detractors) / total) * 100 : 0;

  await admin.firestore().collection("nps_summary").doc("latest").set({
    npsScore: nps,
    npsTotal: total,
    updatedAt: admin.firestore.FieldValue.serverTimestamp(),
  });

  return { success: true };
});

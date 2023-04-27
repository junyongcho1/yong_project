const functions = require("firebase-functions");
const admin = require("firebase-admin");
const auth = require("firebase-auth");


var serviceAccount = require("./yong-project-8b980-firebase-adminsdk-8n6td-9800608026.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});


// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started
//
exports.createCustomToken = functions.region("asia-northeast3").https.onRequest(async(request, response) => {
  const user = request.body;
   
  const uid = `kakao:${user.uid}`;
  const updateParams ={
    email: user.email,
    photoURL: user.photoURL,
    displayName: user.displayName,
  };

  try {
    await admin.auth().updateUser(uid,updateParams);
  } catch (e) {
    console.log('Error updating user:', e);
    updateParams["uid"]=uid;
    await admin.auth().createUser(updateParams);
  }

  try {
    const token = await admin.auth().createCustomToken(uid);
    response.send(token);
  } catch (e) {
    console.log('Error creating custom token:', e);
    response.status(500).send('Error creating custom token');
  }
});

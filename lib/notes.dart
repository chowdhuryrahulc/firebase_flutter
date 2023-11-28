/*
PlayList: Rohit Semriwal Tutorials: https://www.youtube.com/watch?v=gnbhFImcSv0&list=PLr7P7lMIUTuukkflWTYrPgTwueG-BoUHN

-> Dependencies:
  - firebase_core       :for any firebase-flutter project we have to add firebase_core package
  - firebase_auth       :for authentication
  - cloud_firestore     :document database (like mongodb or dynamodb)
  - firebase_storage    :for large storage (like S3)
  - firebase_messaging  :for sending notifications (SNS)

-> Firebase install in Flutter
  - 2 ways. Either old way like android, ios, changing gradle, copping json file etc..
  - 2nd way is via cli. In firebase, click flutter, paste cmds in terminal, and done. It will also generate firebase_options.dart
    Then paste "await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);" in main.dart. As done here
  - For exact info, see video-1 in this playlist for both the methods

-> ErrSol: dont forget to add "multiDexEnabled true" in android/app/build.gradle

-> Authentication:
  - install "firebase_auth" dependency. Here we will only do "email-password" and "phone" verification
  - go to firebase console, authentication and enable email/password and phone. 
  - Email:
    - signup: FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    - signin: FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  - Phone:
    - add test phone number. Bcoz if you get multiple otp in same number, the number might get blocked
    - This also needs SHA-1 & SHA-256 keys. So open android folder in AndroidStudio (by right click in vscode) and type 
      "gradlew signinReport". Then Ctrl+Enter. Copy SHA-1 & SHA-256 keys. 
      Then go to firebase console. Click on settings (near project settings), project settings, below save both the keys
    - Disable Capcha Verification: go to google cloud console, top select the firebase project, api&services, (not written..)
    - iOS also not written

-> Firebase stores the user credentials in the users local storage. So after authenticating we can use:
    home: (FirebaseAuth.instance.currentUser != null) ? HomeScreen() : SignInWithPhone(),
    in main.dart. The users not signed in, redirect to sign-in page. The users that are signed in, redirect to HomeScreen
    [use this in LanguageApp, and store credentials in users phone]

-> We will shore Images in firebase-storage (like S3) and the link to the url will be stored in cloud firestore (like dynamodb)

-> Cloud Firestore:
  - we put our data in a Map. And add data to firestore like:
    FirebaseFirestore.instance.collection("users").add(userData);
  - userData: Map{}, collection: "users" or any name
  - We get data like: 
    FirebaseFirestore.instance.collection("users").where("age", isGreaterThanOrEqualTo: 19).orderBy("age", descending: true).snapshots(),
  - in StreamBuilder. "where" etc are filters. We can also add sorting in this using "orderBy".
  - see home_screen.dart
  - ErrSol: dont forget to change the rule in irebase colsole to true. So we can write & read from cloud firestore

-> Firebase Storage:
  - to upload in a bucket named "profilepictures": 
    UploadTask uploadTask = FirebaseStorage.instance.ref().child("profilepictures").child(Uuid().v1()).putFile(profilepic!);
  - to see how much % has been uploaded: (dont forget to close the stream)
    uploadTask.snapshotEvents.listen((snapshot) {...}
  - for image picker, no need for any modification in android. But for iOS you need some modifications

-> Firebase Messaging:
  - 
  - 
  - 
  - 

*/
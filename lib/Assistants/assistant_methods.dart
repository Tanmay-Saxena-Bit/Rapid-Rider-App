
import 'package:firebase_database/firebase_database.dart';
import 'package:user1/global/global.dart';

import '../models/user_model.dart';

class AssistantMethods {

  static void readCurrentOnlineUserInfo() async{
    currentUser = firebaseAuth.currentUser;
    DatabaseReference userRef = FirebaseDatabase.instance
      .ref()
      .child("users")
      .child(currentUser!.uid);

    userRef.once().then((snap){
      if(snap.snapshot.value !=null){
        userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot);
      }
    });

  }

}
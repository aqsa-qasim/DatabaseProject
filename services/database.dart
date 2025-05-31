import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  Future addPersonRecord(Map<String,dynamic>PersonMap,String id)async{
return await FirebaseFirestore.instance
    .collection("Person")
    .doc(id)
    .set(PersonMap);
  }
   Future<Stream<QuerySnapshot>> getPersonData()async{
    return await FirebaseFirestore. instance.collection("Person").snapshots();
   }
   Future UpdataUserInfo(String id, Map<String,dynamic> UpdateMap)async{
    return await FirebaseFirestore.instance.collection("Person").doc(id).update(UpdateMap);
   }

  Future DeleteUserInfo(String id)async{
    return await FirebaseFirestore.instance.collection("Person").doc(id).delete();
  }
}
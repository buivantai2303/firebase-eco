import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_eco/utils/helpers/firebase_storage_service.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  FirebaseFirestore,
  CollectionReference<Map<String, dynamic>>, // Specify the type parameter for CollectionReference
  DocumentReference<Map<String, dynamic>>,
  DocumentSnapshot<Map<String, dynamic>>,
  Query<Map<String, dynamic>>,
  QuerySnapshot<Map<String, dynamic>>,
  QueryDocumentSnapshot<Map<String, dynamic>>,
  TFirebaseStorageService,
])
void main() {}

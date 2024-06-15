import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  DocumentSnapshot<Map<String, dynamic>>, // Chỉ định kiểu cụ thể
  Query,
  QuerySnapshot,
  QueryDocumentSnapshot<Map<String, dynamic>>, // Chỉ định kiểu cụ thể
])
void main() {}

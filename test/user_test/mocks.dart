import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  DocumentSnapshot<Map<String, dynamic>>, // Loại cụ thể
  Query,
  QuerySnapshot,
  QueryDocumentSnapshot<Map<String, dynamic>>, // Loại cụ thể
], customMocks: [
  MockSpec<DocumentSnapshot<Map<dynamic, dynamic>>>(as: #MockDocumentSnapshot1),
  MockSpec<QueryDocumentSnapshot<Map<dynamic, dynamic>>>(as: #MockQueryDocumentSnapshot1),
])
void main() {}

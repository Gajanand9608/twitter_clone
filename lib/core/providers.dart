import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/appwrite_constants.dart';

final appwriteClientProvider = Provider((ref) {
  Client client = Client();
  return client
      .setEndpoint(AppwriteConstants.endPoint)
      .setProject(AppwriteConstants.projectId)
      .setSelfSigned(
        status: true,
      );
});

final appwriteAccountProvider = Provider((ref){
  final client = ref.watch(appwriteClientProvider);
  return Account(client);
});

final appwriteDatabseProvider = Provider((ref){
  final client = ref.watch(appwriteClientProvider);
  return Databases(client);
});
final appwriteStorageProvider = Provider((ref){
  final client = ref.watch(appwriteClientProvider);
  return Storage(client);
});

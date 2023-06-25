// class AppwriteConstants {
//   static const String databaseId = '6416d60558d677bfc895';
//   //6416d60558d677bfc895
//   static const String projectId = '6416d38e14c4e12f192d';
//   // 6416d38e14c4e12f192d
//   static const String endPoint = 'http://192.168.1.10:80/v1';

//   static const String usersCollection = '641bf07b1c49b2f26cf9';
//   //641bf07b1c49b2f26cf9
//   static const String tweetsCollection = '64204c63eb9d190b89b4';
//   // 64204c63eb9d190b89b4
//   static const String imageBucket = '642053827d0e79213130';
//   static const String nitificationCollection = '643ced98779f64325a38';

//   static String imageUrl(String imageId) => '$endPoint/storage/buckets/$imageBucket/files/$imageId/view?project=$projectId&mode=admin';

// }

class AppwriteConstants {
  static const String databaseId = '64968c1d894f8631354e';
  //6416d60558d677bfc895
  static const String projectId = '64968b1e3282e38511e4';
  // 6416d38e14c4e12f192d
  static const String endPoint = 'https://cloud.appwrite.io/v1';

  static const String usersCollection = '64968cdb9b6212b7aee8'; //
  //641bf07b1c49b2f26cf9
  static const String tweetsCollection = '64968cf1d3abbb4be455';
  // 64204c63eb9d190b89b4
  static const String imageBucket = '64968d337e3e3b033af0';
  static const String nitificationCollection = '64968cfe540a37e71b5d';

  static String imageUrl(String imageId) => '$endPoint/storage/buckets/$imageBucket/files/$imageId/view?project=$projectId&mode=admin';

}


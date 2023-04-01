class AppwriteConstants {
  static const String databaseId = '6416d60558d677bfc895';
  //6416d60558d677bfc895
  static const String projectId = '6416d38e14c4e12f192d';
  // 6416d38e14c4e12f192d
  static const String endPoint = 'http://192.168.100.6:80/v1';

  static const String usersCollection = '641bf07b1c49b2f26cf9';
  static const String tweetsCollection = '64204c63eb9d190b89b4';
  static const String imageBucket = '642053827d0e79213130';

  static String imageUrl(String imageId) => '$endPoint/storage/buckets/$imageBucket/files/$imageId/view?project=$projectId&mode=admin';

}

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/type_defs.dart';
import 'package:appwrite/models.dart' as model;

import '../constants/appwrite_constants.dart';
import '../core/failure.dart';
import '../core/providers.dart';
import '../models/tweet_model.dart';

final tweetAPIProvider = Provider((ref) {
  return TweetAPI(db: ref.watch(appwriteDatabseProvider));
});

abstract class ITweetAPI {
  FutureEither<Document> shareTweet(Tweet tweet);
}

class TweetAPI implements ITweetAPI{
  final Databases _db;
  TweetAPI({required Databases db}) : _db = db;
  @override
  FutureEither<Document> shareTweet(Tweet tweet) async {
    try {
      final document = await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.tweetsCollection,
        documentId: ID.unique(),
        data: tweet.toMap(),
      );
      return right(document);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error',
          st,
        ),
      );
    } catch (e, st) {
      return left(
        Failure(
          e.toString(),
          st,
        ),
      );
    }

  }

}
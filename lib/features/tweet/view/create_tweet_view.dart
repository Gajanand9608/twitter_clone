import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/rounded_small_button.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';

import '../../../common/loading_page.dart';
import '../../../theme/pallete.dart';

class CreateViewTweet extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const CreateViewTweet(),
      );
  const CreateViewTweet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateViewTweetState();
}

class _CreateViewTweetState extends ConsumerState<CreateViewTweet> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    print(currentUser);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
        ),
        actions: [
          RoundedSmallButton(
            onTap: () {},
            label: 'Tweet',
            backgroundColor: Pallete.blueColor,
            textColor: Pallete.whiteColor,
          ),
        ],
      ),
      body: currentUser == null
          ? const Loader()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            currentUser.profilePic,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

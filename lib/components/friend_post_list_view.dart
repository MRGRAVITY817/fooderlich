import 'package:flutter/material.dart';
import 'components.dart';
import '../models/post.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;

  const FriendPostListView({Key? key, required this.friendPosts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
        right: 16,
      ),
      child: Column(
        children: [
          Text('Social Chefs', style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          ListView.separated(
            primary: false,
            // NeverScrollableScrollPhysics will prevent list from getting
            // scrolled. We want our 'screen' scrolled here.
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: friendPosts.length,
            scrollDirection: Axis.vertical,
            // itemBuilder will build items to compose the list
            // according to the function logic
            itemBuilder: (context, index) {
              final post = friendPosts[index];
              return FriendPostTile(post: post);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

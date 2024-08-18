import 'package:benmore_amos/features/posts/data/bloc/post_cubit.dart';
import 'package:benmore_amos/features/posts/data/models/post_response.dart';
import 'package:benmore_amos/features/posts/presentation/pages/create_post.dart';
import 'package:benmore_amos/features/posts/presentation/widgets/post_item.dart';
import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  late PostCubit postCubit ;

  @override
  void initState() {
    postCubit = context.read<PostCubit>();
    postCubit.fetchPosts(page: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: athensGrey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePost()));
        },
        shape: const CircleBorder(),
        backgroundColor: coralOrange,
        elevation: 0.0,
        child: const Icon(Icons.add),
      ),
      body: BlocSelector<PostCubit, PostState, List<Post>?>(
        bloc: postCubit,
        selector: (state) {
          if (state is FetchPostSuccess) {
            return state.posts.posts;
          }
          return postCubit.posts;
        },
        builder: (context, posts) {
          if (posts == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return LazyLoadScrollView(
            onEndOfPage: () {
              postCubit.fetchPosts(page: (posts.length ~/ 10) + 1, isPagination: true);
            },
            child: ListView.builder(
              itemCount: posts.length,
              padding: const EdgeInsets.only(top: 60),
              itemBuilder: (BuildContext context, int index) {
                return PostItem(post: posts[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

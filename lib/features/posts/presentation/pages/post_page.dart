import 'package:benmore_amos/features/posts/data/bloc/post_cubit.dart';
import 'package:benmore_amos/features/posts/presentation/widgets/post_item.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/custom_error_widget.dart';
import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  PostCubit postCubit = PostCubit();

  @override
  void initState() {
    postCubit.fetchPosts(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: athensGrey,
      body: BlocBuilder<PostCubit, PostState>(
        bloc: postCubit,
        builder: (context, state) {
          if(state is FetchPostLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is FetchPostSuccess){
            return ListView.builder(
              itemCount: state.posts.posts?.length,
              padding: const EdgeInsets.only(top: 60),
              itemBuilder: (BuildContext context, int index) {
                return PostItem(post: state.posts.posts?[index],);
              },
            );
          }
          if(state is FetchPostError){
            return CustomErrorWidget(
              error: state.error,
              onTap: () {
                postCubit.fetchPosts(0);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

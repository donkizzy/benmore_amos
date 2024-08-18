import 'package:benmore_amos/features/posts/data/bloc/post_cubit.dart';
import 'package:benmore_amos/features/posts/presentation/widgets/comment_item.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/custom_error_widget.dart';
import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentWidget extends StatefulWidget {
  final String? postId ;
  const CommentWidget({super.key, required this.postId});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> with AutomaticKeepAliveClientMixin<CommentWidget>{
  PostCubit postCubit = PostCubit();

  @override
  void initState() {
    postCubit.fetchComments(widget.postId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<PostCubit, PostState>(
      bloc: postCubit,
      builder: (context, state) {
        if(state is FetchCommentsLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(state is FetchCommentSuccess){
          return  (state.comments.comments ?? []).isNotEmpty ? ListView.separated(
            itemCount: state.comments.comments?.length ?? 0,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return CommentItem(
                comment: state.comments.comments?[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10,);
            },) : const Center(child: Text('No comments yet....', style: TextStyle(
              fontSize: 18, color: ebonyClay, fontWeight: FontWeight.w900)),);
        }
        if(state is FetchCommentError){
          return CustomErrorWidget(
            error: state.error,
            onTap: () {
              postCubit.fetchComments(widget.postId);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  @override
  bool get wantKeepAlive => true ;
}

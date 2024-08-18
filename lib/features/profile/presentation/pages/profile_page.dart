import 'package:benmore_amos/core/injector.dart';
import 'package:benmore_amos/core/storage_manager.dart';
import 'package:benmore_amos/features/posts/data/bloc/post_cubit.dart';
import 'package:benmore_amos/features/profile/data/bloc/profile_cubit.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/circular_image.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/custom_error_widget.dart';
import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String? userId;

  const ProfilePage({super.key, required this.userId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileCubit profileCubit = ProfileCubit();
  PostCubit postCubit = PostCubit();
  StorageManager storageManager = sl<StorageManager>();

  @override
  void initState() {
    profileCubit.fetchProfile(widget.userId ?? '');
    postCubit.fetchPosts(page: 1, userId: widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: athensGrey,
        body: NestedScrollView(
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  bloc: profileCubit,
                  builder: (context, state) {
                    if (state is FetchProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is FetchProfileSuccess) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(41),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(color: athensGrey, shape: BoxShape.circle),
                                        child: const Icon(Icons.arrow_back),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(color: athensGrey, shape: BoxShape.circle),
                                      child: const Icon(Icons.settings),
                                    ),
                                  ],
                                ),
                                CustomCircularImage(
                                  imageUrl: state.profile.profilePicture,
                                  radius: 70,
                                ),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(state.profile.username ?? 'N/A',
                                        style: const TextStyle(fontSize: 30, color: ebonyClay, fontWeight: FontWeight.w900)),
                                    const SizedBox(width: 5),
                                    const Icon(Icons.verified, color: coralOrange, size: 24),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                 Text(state.profile.email ?? 'N/A',
                                    style: const TextStyle(fontSize: 16, color: ironGrey, fontWeight: FontWeight.w600)),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                           if(widget.userId != storageManager.getUserId() )  ...[
                             Flexible(
                               child: Container(
                                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(48),
                                   color: coralOrange,
                                 ),
                                 child: const Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(
                                       Icons.person_add,
                                       color: Colors.white,
                                     ),
                                     SizedBox(
                                       width: 12,
                                     ),
                                     Text(
                                       'Follow',
                                       style:
                                       TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                             const SizedBox(
                               width: 5,
                             ),
                           ],
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(48),
                                    color: Colors.white,
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.mail,
                                        color: ebonyClay,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        'Message',
                                        style: TextStyle(color: ebonyClay, fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Column(
                                    children: [
                                      Text('${state.profile.totalFollowers ?? 'N/A'}',
                                          style: const TextStyle(
                                              fontSize: 24, color: ebonyClay, fontWeight: FontWeight.w900)),
                                      const Text('Followers',
                                          style: TextStyle(fontSize: 16, color: ironGrey, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Column(
                                    children: [
                                      Text('${state.profile.totalLikesGiven ?? 'N/A'}',
                                          style: const TextStyle(
                                              fontSize: 24, color: ebonyClay, fontWeight: FontWeight.w900)),
                                      const Text('Likes',
                                          style: TextStyle(fontSize: 16, color: ironGrey, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Column(
                                    children: [
                                      Text('${state.profile.profileViews ?? 'N/A'}',
                                          style: const TextStyle(
                                              fontSize: 24, color: ebonyClay, fontWeight: FontWeight.w900)),
                                      const Text('Views',
                                          style: TextStyle(fontSize: 16, color: ironGrey, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      );
                    }
                    if (state is FetchProfileError) {
                      return CustomErrorWidget(
                        error: state.error,
                        onTap: () {
                          profileCubit.fetchProfile(widget.userId ?? '');
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              )),
            ];
          },
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(41),
            ),
            child: BlocBuilder<PostCubit, PostState>(
              bloc: postCubit,
              builder: (context, state) {
                if(state is FetchPostLoading){
                  return const Center(child: CircularProgressIndicator());
                }
                if(state is FetchPostSuccess){
                  return GridView.custom(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 8),
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        const QuiltedGridTile(2, 1,),
                        const QuiltedGridTile(1, 1),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      childCount: state.posts.posts?.length,
                          (context, index) => Stack(
                        alignment: Alignment.topRight,
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: state.posts.posts?[index].imageUrl ?? "http://via.placeholder.com/200x150",
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(44),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,),
                              ),
                            ),
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: ebonyClay.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.more_vert_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if(state is FetchPostError){
                  return CustomErrorWidget(
                    error: state.error,
                    onTap: () {
                      postCubit.fetchPosts(page: 1);
                    },
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ));
  }
}

import 'package:benmore_amos/features/posts/presentation/widgets/comment_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:benmore_amos/features/posts/data/models/post_response.dart';
import 'package:benmore_amos/features/profile/presentation/pages/profile_page.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/circular_image.dart';
import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:benmore_amos/utilities/utilities.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post? post ;
  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10.0, left: 10, right: 10,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(41),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(userId: post?.assignedTo?.id,)));
            },
            child:  Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Row(
                children: [
                  CustomCircularImage(
                    imageUrl: post?.assignedTo?.profilePicture,
                    radius: 24,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(post?.assignedTo?.username ?? 'N/A',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: ebonyClay)),
                          const SizedBox(width: 5),
                          const Icon(Icons.verified, color: coralOrange, size: 24),
                        ],
                      ),
                      Text(timeago.format((post?.createdAt ?? DateTime.now())),
                          style: const TextStyle(fontSize: 16, color: ironGrey, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(post?.title ?? 'N/A', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: ebonyClay)),
          Text(post?.description ?? 'N/A', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: ebonyClay)),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: height(context) / 2,
            child: Stack(
              alignment: Alignment.topLeft,
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(57),
                  child: CachedNetworkImage(
                    imageUrl: post?.imageUrl ?? "http://via.placeholder.com/200x150",
                    imageBuilder: (context, imageProvider) => Container(
                      height: height(context) / 2,
                      width: width(context) * .9,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,),
                      ),
                    ),
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  width: width(context) - 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {

                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: ebonyClay.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: ebonyClay.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.more_vert_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                // Navigator.of(context).push(smartAnimate(const AddCaption()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: ebonyClay.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.message,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
              child: CommentWidget(
            postId: post?.id,
          )),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

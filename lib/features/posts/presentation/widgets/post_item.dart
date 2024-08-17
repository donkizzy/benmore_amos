import 'package:benmore_amos/core/injector.dart';
import 'package:benmore_amos/core/storage_manager.dart';
import 'package:benmore_amos/features/posts/data/models/post_response.dart';
import 'package:benmore_amos/features/posts/presentation/widgets/comment_item.dart';
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
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
                      const Text('yesterday at 11:30',
                          style: TextStyle(fontSize: 16, color: ironGrey, fontWeight: FontWeight.w600)),
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
                  child: Image.network(
                    'https://picsum.photos/1024/1024',
                    height: height(context) / 2,
                    width: width(context) * .9,
                    fit: BoxFit.cover,
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
                          // Navigator.of(context).push(smartAnimate(const AddCaption()));
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
                                StorageManager storageManager = sl<StorageManager>();
                                storageManager.clearAll();
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
          const CommentItem()
        ],
      ),
    );
  }
}

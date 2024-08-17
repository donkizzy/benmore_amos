import 'package:benmore_amos/features/posts/data/models/comment_response.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/circular_image.dart';
import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final Comment? comment ;
  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCircularImage(
          imageUrl: comment?.user?.profilePicture ,
          radius: 20,
        ),
        const SizedBox(width: 12),
         Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(comment?.user?.username ?? 'N/A', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                  const SizedBox(width: 5),
                  const Icon(Icons.verified, color: coralOrange, size: 24),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(comment?.comment ?? 'N/A',
                  style: const TextStyle(fontSize: 16, color: ebonyClay, fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 5,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                    children: [
                      Text(timeago.format((comment?.createdAt ?? DateTime.now())),
                          style: const TextStyle(
                            color: ironGrey,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Reply',
                          style: TextStyle(fontSize: 16, color: coralOrange, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite_border_outlined,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        comment?.likes.toString() ?? '0',
                        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                      ),
                      const SizedBox(width: 10,)
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ) ;
  }
}

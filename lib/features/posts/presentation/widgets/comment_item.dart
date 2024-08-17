import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage('https://picsum.photos/200/30'),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Darrel Steward', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                  SizedBox(width: 5),
                  Icon(Icons.verified, color: coralOrange, size: 24),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text('Finally Congratulations on completing your project',
                  style: TextStyle(fontSize: 16, color: ebonyClay, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('today at 11:30',
                          style: TextStyle(
                            color: ironGrey,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Reply',
                          style: TextStyle(fontSize: 16, color: coralOrange, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border_outlined,
                        size: 20,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '173',
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                      ),
                      SizedBox(width: 10,)
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

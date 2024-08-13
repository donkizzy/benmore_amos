import 'package:benmore_amos/features/profile/presentation/pages/profile_page.dart';
import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:benmore_amos/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: athensGrey,
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 60.0, left: 10, right: 10, bottom: 10),
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
              child: const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage('https://picsum.photos/200/30'),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Darrel Steward',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: ebonyClay)),
                            SizedBox(width: 5),
                            Icon(Icons.verified, color: coralOrange, size: 24),
                          ],
                        ),
                        Text('yesterday at 11:30',
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
            Expanded(
              child: Stack(
                alignment: Alignment.topLeft,
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  CustomCarouselSlider(
                    items: [
                      CarouselItem(
                        image: const NetworkImage(
                          'https://picsum.photos/1024/1024',
                        ),
                        boxDecoration:  BoxDecoration(
                         color: Colors.transparent,
                          borderRadius: BorderRadius.circular(44)
                        ),
                        title:
                        'Push your creativity to its limits by reimagining this classic puzzle!',
                        titleTextStyle: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                        onImageTap: (i) {},
                      ),
                      CarouselItem(
                        image: const NetworkImage(
                          'https://picsum.photos/1024/1024',
                        ),
                        boxDecoration:  BoxDecoration(
                         color: Colors.transparent,
                          borderRadius: BorderRadius.circular(44)
                        ),
                        title:
                        'Push your creativity to its limits by reimagining this classic puzzle!',
                        titleTextStyle: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                        onImageTap: (i) {},
                      ),
                      CarouselItem(
                        image: const NetworkImage(
                          'https://picsum.photos/1024/1024',
                        ),
                        boxDecoration:  BoxDecoration(
                         color: Colors.transparent,
                          borderRadius: BorderRadius.circular(44)
                        ),
                        title:
                        'Push your creativity to its limits by reimagining this classic puzzle!',
                        titleTextStyle: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                        onImageTap: (i) {},
                      ),
                    ],
                    height: height(context) / 2,
                    width: width(context) * .9,
                    autoplay: false,
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
                        Column(
                          children: [
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
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
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
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
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

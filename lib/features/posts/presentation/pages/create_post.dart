import 'dart:io';

import 'package:benmore_amos/features/posts/data/bloc/post_cubit.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/custom_button.dart';
import 'package:benmore_amos/features/shared/presentation/widgets/custom_text_field.dart';
import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:benmore_amos/utilities/form_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> with FormMixin {
  final TextEditingController emailController = TextEditingController();
  ValueNotifier<File?> image = ValueNotifier<File?>(null);
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  PostCubit postCubit = PostCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: athensGrey,
      appBar: AppBar(
        title: const Text('Create Post'),
        backgroundColor: athensGrey,
      ),
      body: BlocListener<PostCubit, PostState>(
        bloc: postCubit,
        listener: (context, state) {

        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const SizedBox(
              height: 48,
            ),
            CustomTextField(
              controller: emailController,
              hintText: 'Title',
              validator: isRequired,
            ),
            const SizedBox(
              height: 48,
            ),
            CustomTextField(
              controller: emailController,
              hintText: 'Description',
              validator: isRequired,
            ),
            const SizedBox(
              height: 48,
            ),
            ValueListenableBuilder(
              valueListenable: image,
              builder: (BuildContext context, File? value, Widget? child) {
                return GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    var img = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    image.value = File(img?.path ?? '');
                  },
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(43)),
                    child: value == null
                        ? const Center(
                            child: Icon(Icons.add),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(43),
                            child: Image.file(
                              value,
                              fit: BoxFit.cover,
                            )),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 48,
            ),
            CustomButton(
              title: 'Create Post',
              isLoading: _isLoading,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

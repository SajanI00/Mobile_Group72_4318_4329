import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/core/constants/app_colors.dart';
import 'package:pet_adoption_app/core/constants/constants.dart';
import 'package:pet_adoption_app/features/posts/providers/posts_provider.dart';
import 'package:pet_adoption_app/features/posts/utils/image.dart';
import 'package:pet_adoption_app/features/posts/presentation/image_view.dart';
import 'package:pet_adoption_app/widgets/round_button.dart';
import 'package:pet_adoption_app/widgets/round_text_field.dart';
import 'package:pet_adoption_app/widgets/type_picker.dart';
import 'package:intl/intl.dart';

final _formKey = GlobalKey<FormState>();

class CreatePostScreen extends ConsumerStatefulWidget {
  const CreatePostScreen({super.key});

  static const routeName = '/createPost';

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  File? file;
  bool isLoading = false;
  String postType = 'male';
  DateTime selectedDate = DateTime.now();

  // controllers
  late final TextEditingController _nameController;
  late final TextEditingController _contactNumberController;
  late final TextEditingController _locationController;
  late final TextEditingController _dateController;
  late final TextEditingController _messageController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _contactNumberController = TextEditingController();
    _locationController = TextEditingController();
    _dateController = TextEditingController();
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactNumberController.dispose();
    _locationController.dispose();
    _dateController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> makePost() async {
    setState(() => isLoading = true);

    try {
      await ref.read(postsProvider).makePost(
            username: _nameController.text,
            contactNumber: _contactNumberController.text,
            location: _locationController.text,
            postType: postType,
            date: selectedDate,
            file: file,
            description: _messageController.text,
          );

      setState(() => isLoading = false);
      Navigator.of(context).pop();
    } catch (error) {
      print("Error making post: $error");
      setState(() => isLoading = false);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.realWhiteColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: Constants.defaultPadding,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Column(
                  children: [
                    RoundTextField(
                      controller: _nameController,
                      hintText: 'Enter your name',
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 10),
                    RoundTextField(
                      controller: _contactNumberController,
                      hintText: 'Enter your contact number: 0xx xxx xxxx',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 10),
                    RoundTextField(
                      controller: _locationController,
                      hintText: 'Enter the location/address',
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    selectedDate != null
                        ? 'Select the Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}'
                        : 'Pick a Date',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                TypePicker(
                  postType: postType,
                  onChanged: (value) {
                    postType = value ?? 'lost';
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20),
                // Phone number / email text field
                RoundTextField(
                  controller: _messageController,
                  hintText: 'Enter the description',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                file != null
                    ? ImageView(
                        file: file!,
                      )
                    : PickFileWidget(
                        pickImage: () async {
                          file = await pickImage();
                          setState(() {});
                        },
                      ),

                const SizedBox(height: 20),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : RoundButton(
                        onPressed: makePost,
                        label: 'Post',
                      ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PickFileWidget extends StatelessWidget {
  const PickFileWidget({super.key, required this.pickImage});

  final VoidCallback pickImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: pickImage, child: const Text('Pick Image')),
        const Divider()
      ],
    );
  }
}

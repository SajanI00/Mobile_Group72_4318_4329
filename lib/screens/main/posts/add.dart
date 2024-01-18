import 'package:flutter/material.dart';
import 'package:pet_adoption_app/services/posts.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final PostService _postService = PostService();
  String usernameText = '';
  String numberText = '';
  String locationText = '';
  String typeText = '';
  String dateText = '';
  String descriptionText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Message'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              _postService.savePost(usernameText);
              Navigator.pop(context);
            },
            child: const Text('Post', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    usernameText = val;
                  });
                },
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    numberText = val;
                  });
                },
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    locationText = val;
                  });
                },
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    typeText = val;
                  });
                },
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    dateText = val;
                  });
                },
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    descriptionText = val;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

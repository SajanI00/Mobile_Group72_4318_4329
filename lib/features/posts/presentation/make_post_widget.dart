import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption_app/features/posts/presentation/create_post_screen.dart';

class MakePostWidget extends StatelessWidget {
  const MakePostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(CreatePostScreen.routeName);
        },
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPostTextField(),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    FontAwesomeIcons.solidImages,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildPostTextField() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xffabd4e7)),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.add, 
              color: Colors.transparent, 
            ), 
            Text(
              'Leave your Message here',
              style: TextStyle(
                color: Colors.black, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}

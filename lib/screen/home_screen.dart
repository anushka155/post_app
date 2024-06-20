import 'package:flutter/material.dart';
import 'package:post_app/screen/comment_screen.dart';
import 'package:post_app/service/api_service.dart';

import '../model/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post>? posts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  posts = await ApiService().getPost();
                  setState(() {});
                },
                child: Text("Fetch Post")),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: posts == null ? 0 : posts!.length,
                itemBuilder: (context, index) {
                  var post = posts![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CommentScreen(id: post.id.toString())));
                    },
                    child: Column(
                      children: [Text(post.title), Text(post.body)],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextPage extends StatefulWidget {
  const TextPage({super.key});

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {

  final List<Map<String, String>> textPosts = [
    {'id': '1', 'text': 'This is a text post 1'},
    {'id': '2', 'text': 'This is a text post 2'},
    {'id': '3', 'text': 'This is a text post 3'},
  ];

  Future<void> _launchURL(String postId) async {
    final Uri webUrl = Uri.parse("https://yourwebsite.com/post?id=$postId");

    if (!await launchUrl(webUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $webUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Post"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.separated(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: width * 0.4,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            textPosts[index]['text']!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: width * 0.02),

                      GestureDetector(
                        onTap: () => _launchURL(textPosts[index]['id']!),
                        child: Container(
                          width: width * 0.3,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Share',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: width * 0.05);
                },
                itemCount: textPosts.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
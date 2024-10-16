import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final List<Map<String, String>> images = [
    {
      'image': "https://media.istockphoto.com/id/1398473177/photo/questionnaire-with-checkboxes-filling-survey-form-online-answer-questions.jpg?s=1024x1024&w=is&k=20&c=A38N141knXQRDuPUZCsj_dIKkJa-pnsT_lz3QK3_6n4=",
      'id': '1',
    },
    {
      'image': "https://media.istockphoto.com/id/1398473177/photo/questionnaire-with-checkboxes-filling-survey-form-online-answer-questions.jpg?s=1024x1024&w=is&k=20&c=A38N141knXQRDuPUZCsj_dIKkJa-pnsT_lz3QK3_6n4=",
      'id': '2',
    },
    {
      'image': "https://media.istockphoto.com/id/1398473177/photo/questionnaire-with-checkboxes-filling-survey-form-online-answer-questions.jpg?s=1024x1024&w=is&k=20&c=A38N141knXQRDuPUZCsj_dIKkJa-pnsT_lz3QK3_6n4=",
      'id': '3',
    }
  ];

  Future<void> _launchURL(String imageId) async {
    final Uri url = Uri.parse(
        "https://yourwebsite.com/post?id=$imageId" // The fallback URL
    );

    final Uri appUri = Uri.parse("yourapp://post?id=$imageId");

    if (!await launchUrl(appUri, mode: LaunchMode.externalApplication)) {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Image Post"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView.separated(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // Displaying Image
                      Container(
                        height: width * 0.4,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(images[index]['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _launchURL(images[index]['id']!),
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
                  return SizedBox(
                    height: width * 0.05,
                  );
                },
                itemCount: images.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

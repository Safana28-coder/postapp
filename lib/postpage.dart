import 'package:flutter/material.dart';
import 'Imagepage.dart';
import 'Textpage.dart';
import 'Videopage.dart';


class Postpage extends StatefulWidget {
  const Postpage({super.key});

  @override
  State<Postpage> createState() => _PostpageState();
}

class _PostpageState extends State<Postpage> {
  int selectedindex = 0;
  List post = [ImagePage(), VideoApp(), TextPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              selectedindex = value;
              setState(() {});
            },
            iconSize: 25,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.red,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedindex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.image_outlined), label: 'Image'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.videocam_outlined), label: "Video"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.text_snippet_outlined), label: "Text")
            ]),
        backgroundColor: Colors.white,
        body: Center(
          child: post.elementAt(selectedindex),
        ));
  }
}

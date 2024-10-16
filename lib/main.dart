import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postapp/postpage.dart';
import  'firebase_options.dart';

var width;
var height;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(

          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.amberAccent.withOpacity(0.9)),
          ),
          home: Postpage()),
    );
  }
}




Future<Uri> createDynamicLink(String postId, String postType) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://indeedproject.page.link',  // Your dynamic link domain
    link: Uri.parse('https://indeedproject.page.link/?postId=$postId&postType=$postType'),  // Link to handle the post data
    androidParameters: AndroidParameters(
      packageName: 'com.example.untitled4',  // Your Android app ID
      minimumVersion: 1,
    ),
    iosParameters: IOSParameters(
      bundleId: 'com.yourcompany.yourapp',  // Replace with your iOS bundle ID if you have one
      minimumVersion: '1.0.0',
      appStoreId: 'yourAppStoreId',  // Optional: your App Store ID
    ),
    socialMetaTagParameters: SocialMetaTagParameters(
      title: 'Check out this post!',
      description: 'This is a $postType post in our app',
      imageUrl: Uri.parse('https://yourwebsite.com/post-image.png'), // Optional image URL for social sharing
    ),
  );

  // Build the short dynamic link
  final ShortDynamicLink shortDynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(parameters);
  return shortDynamicLink.shortUrl;  // Return the short URL
}

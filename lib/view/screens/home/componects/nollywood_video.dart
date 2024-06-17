import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../modal/category_modal.dart';
import '../../video/video_screen.dart';

Padding nollywoodVideo(double height, Category categoryNollywood, double width) {
  return Padding(
    padding:
    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Nollywood Movies & TV',
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.18,
          child: ListView.builder(
            itemCount: categoryNollywood.videos.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(
                        categoryIndex: 1,
                        videoPlayerIndex: index,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(categoryNollywood
                                .videos[index].thumb),
                            fit: BoxFit.cover)),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

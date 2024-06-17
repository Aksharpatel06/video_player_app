import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../video/video_screen.dart';

Column playMyListInfo(double height, BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: height * 0.02,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Icon(
                Icons.add,
                size: 27,
              ),
              Text(
                'My List',
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 14
                ),
              ),
            ],
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const VideoPlayerScreen(
                    categoryIndex: 2,
                    videoPlayerIndex: 0,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color(0xffC4C4C4),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Play',
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              const Icon(
                Icons.info,
                size: 27,
              ),
              Text(
                'Info',
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

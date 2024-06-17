import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../../../utils/video_list.dart';
import '../../modal/category_modal.dart'; // Ensure this file provides the necessary structures

class VideoPlayerScreen extends StatefulWidget {
  final int categoryIndex;
  final int videoPlayerIndex;

  const VideoPlayerScreen({
    super.key,
    required this.categoryIndex,
    required this.videoPlayerIndex,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void initializeVideoPlayer() async {
    try {
      final category =
          Category.fromJson(mediaJSON["categories"]![widget.categoryIndex]);
      final videoPath = category.videos[widget.videoPlayerIndex]
          .sources; // Adjust according to your JSON structure

      _videoPlayerController = VideoPlayerController.asset(videoPath);

      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
      );

      if (mounted) {
        setState(() {
          // Update UI to reflect initialization
        });
      }
    } catch (e) {
      print("Error initializing video player: $e");
      // Handle initialization error, e.g., show error message to user
    }
  }

  @override
  Widget build(BuildContext context) {
    final category =
    Category.fromJson(mediaJSON["categories"]![widget.categoryIndex]);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _chewieController != null &&
                    _chewieController!.videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: Chewie(
                      controller: _chewieController!,
                    ),
                  )
                : Container(
                    height: 250,
                    color: Colors.black,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  SizedBox(
                    width: width*0.55,
                  ),
                  Column(
                    children: [
                      const Icon(Icons.notifications_active),
                      Text(
                        'Remind Me',
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w100,
                          fontSize: 12
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width*0.1,
                  ),
                  Column(
                    children: [
                      const Icon(Icons.share),
                      Text(
                        'Share',
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w100,
                            fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.videos[widget.videoPlayerIndex].title,
                    style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    category.videos[widget.videoPlayerIndex].subtitle,
                    style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      category.videos[widget.videoPlayerIndex].description,
                      maxLines: 5,
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'My Lists',
                style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.18,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width * 0.25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("asset/img/video_image/my Lists/img${index}.png"),
                              fit: BoxFit.cover)),
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

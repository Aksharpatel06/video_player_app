import 'package:flutter/material.dart';
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
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Night Drive Mashup 2024 | AfterMorning | Chillout | Road Trip Log Drive Mashup',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                const Text(
                  'data', // Adjust this to display actual data
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '200',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.insert_comment_outlined,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '200',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

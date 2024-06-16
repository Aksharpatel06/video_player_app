To add Chewie, a higher-level video player widget built on top of the `video_player` package, to your Flutter project, follow these steps:

### Step 1: Add Dependencies

First, add both the `video_player` and `chewie` dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  video_player: latest_version
  chewie: latest_version
```

Replace `latest_version` with the most recent versions of these packages, which you can find on [pub.dev](https://pub.dev/packages/video_player) and [pub.dev](https://pub.dev/packages/chewie).

### Step 2: Import the Packages

In your Dart file, import both the `video_player` and `chewie` packages:

```dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
```

### Step 3: Initialize and Create a Chewie Controller

You need to initialize both `VideoPlayerController` and `ChewieController` to manage the video playback.

Here is an example of how to set up a video player with Chewie:

```dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

void main() => runApp(VideoPlayerApp());

class VideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      'https://www.example.com/sample_video.mp4',
    );

    _videoPlayerController.initialize().then((_) {
      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: _videoPlayerController.value.aspectRatio,
          autoPlay: true,
          looping: true,
        );
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chewie Video Player Example'),
      ),
      body: Center(
        child: _chewieController != null && _chewieController.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController,
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
```

### Explanation

1. **Initialize the VideoPlayerController and ChewieController**:
    - In `initState()`, the `_videoPlayerController` is initialized with a video URL.
    - The controller is then initialized, and in the `then` callback, the `_chewieController` is set up.
    - `autoPlay: true` makes the video start playing automatically.
    - `looping: true` makes the video loop indefinitely.

2. **Dispose the Controllers**:
    - Both controllers are disposed of in the `dispose()` method to free up resources.

3. **Build the UI**:
    - The `Chewie` widget is used to play the video.
    - A `CircularProgressIndicator` is shown while the video is initializing.

### Additional Features

- **Customizing Chewie Controls**:
    - You can customize various aspects of the Chewie player by passing additional parameters to the `ChewieController`.
    ```dart
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoPlay: true,
      looping: true,
      // Additional customizations
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
      autoInitialize: true,
    );
    ```

- **Full-Screen Mode**:
    - Chewie supports full-screen mode out of the box. You can toggle full-screen by clicking the full-screen button on the video controls.

### Conclusion

Using Chewie in combination with the `video_player` package provides a powerful and flexible way to handle video playback in Flutter. It abstracts away much of the complexity of handling video playback, offering an easy-to-use API with rich features. Always refer to the [official Chewie documentation](https://pub.dev/packages/chewie) for the latest features and updates.

### ScreenShorts  



<p align='center'>
  <img src='https://github.com/Aksharpatel06/video_player_app/assets/143181114/3283dbe3-7780-42be-bd5a-2be2962aa4c1' width=240>
  <img src='https://github.com/Aksharpatel06/video_player_app/assets/143181114/0d177cf0-cd2e-42f0-ae0f-d09cc666cc7b' width=240>
  <img src='https://github.com/Aksharpatel06/video_player_app/assets/143181114/c18ae8a0-8056-4a87-8e39-1ec6c4516ad0' width=240>
  <img src='https://github.com/Aksharpatel06/video_player_app/assets/143181114/c5ca7731-6916-4618-b596-c315e4ba79ff' width=240>
  <img src='https://github.com/Aksharpatel06/video_player_app/assets/143181114/e61d501c-13ba-4a45-a789-ad0e024baac6' width=240>
</p>
<p align='center'>
<img src='https://github.com/Aksharpatel06/video_player_app/assets/143181114/4b78617b-755e-4878-ba31-32e1b1cd094c' width=500>
</p>

[Go to Dart Code](https://github.com/Aksharpatel06/video_player_app/tree/master/lib)
### video


https://github.com/Aksharpatel06/video_player_app/assets/143181114/afcae41e-a740-4d48-b868-928346900b24



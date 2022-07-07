import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tv_project_beta_01/src/model/channel_model.dart';
import 'package:video_player/video_player.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late final channelData =
      ModalRoute.of(context)!.settings.arguments as ChannelModel;

  late final _controller = VideoPlayerController.network(channelData.urlStream);

  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      _controller
        ..initialize().then((_) {
          _controller.play();
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SafeArea(
        child: Scaffold(
          appBar: MediaQuery.of(context).orientation == Orientation.landscape
              ? null
              : AppBar(
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(channelData.logoImage),
                    )
                  ],
                  title: Text(channelData.title),
                ),
          body: MediaQuery.of(context).orientation == Orientation.landscape
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: _controller.value.isInitialized
                      ? Expanded(
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ))
              : Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller))
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            child: Column(
                          children: [
                            Text(channelData.about),
                          ],
                        )),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

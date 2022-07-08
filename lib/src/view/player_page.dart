import 'package:flutter/material.dart';
import 'package:tv_project_beta_01/src/model/channel_model.dart';
import 'package:tv_project_beta_01/src/utils/ux_colors.dart';
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
    var color = CustomColors();
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      color: color.primaryColor(),
      child: Scaffold(
        backgroundColor: color.primaryColor(),
        appBar: orientation == Orientation.landscape
            ? null
            : AppBar(
                backgroundColor: color.primaryColor(),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(channelData.logoImage),
                  )
                ],
                title: Text(channelData.title),
              ),
        body: orientation == Orientation.landscape
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
            : Container(
                color: color.primaryColor(),
                child: Column(
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
                            decoration: BoxDecoration(
                                color: color.secondaryColor(),
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sobre ${channelData.title}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      channelData.about,
                                      style: const TextStyle(
                                        overflow: TextOverflow.fade,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  )
                                ],
                              ),
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

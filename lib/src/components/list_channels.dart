import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tv_project_beta_01/src/controller/channels_controller.dart';
import 'package:tv_project_beta_01/src/model/channel_model.dart';
import 'package:tv_project_beta_01/src/utils/display_size.dart';
import 'package:tv_project_beta_01/src/utils/ux_random_colors.dart';

class ListChannels extends StatelessWidget {
  late List<ChannelModel> listChannel;
  late Axis direction;
  late String category;
  ListChannels(
      {Key? key,
      required this.listChannel,
      required this.direction,
      required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displaySize = DisplaySize();
    final channelController = ChannelController();
    final _randomColors = RandomColors();
    final _intRandom = Random();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            category,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: displaySize.height(context, 0.2),
          child: ListView.builder(
            scrollDirection: direction,
            itemCount:
                channelController.channelFilter(listChannel, category).length,
            itemBuilder: (context, index) {
              var channelData =
                  channelController.channelFilter(listChannel, category)[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Card(
                  color: _randomColors.getColors(_intRandom),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: channelData.logoImage.isEmpty
                                ? const CircularProgressIndicator()
                                : Image.network(
                                    channelData.logoImage,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: Text(
                                channelData.title,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

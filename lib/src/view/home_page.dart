import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_project_beta_01/src/components/list_channels.dart';
import 'package:tv_project_beta_01/src/controller/channels_controller.dart';
import 'package:tv_project_beta_01/src/utils/display_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final channelController =
        Provider.of<ChannelController>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(backgroundColor: Colors.black),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                channelController.getPage(
                    context, channelController, '/searchPage');
              },
              icon: const Icon(Icons.search),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: channelController.getChannels(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                children: [
                  ListChannels(
                      listChannel: channelController.listChannel,
                      direction: Axis.horizontal,
                      category: 'Religioso'),
                  const SizedBox(
                    height: 15,
                  ),
                  ListChannels(
                      listChannel: channelController.listChannel,
                      direction: Axis.horizontal,
                      category: 'Variedades'),
                  const SizedBox(
                    height: 15,
                  ),
                  ListChannels(
                      listChannel: channelController.listChannel,
                      direction: Axis.horizontal,
                      category: 'Som'),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

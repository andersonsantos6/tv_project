import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_project_beta_01/src/components/list_channels.dart';
import 'package:tv_project_beta_01/src/controller/channels_controller.dart';
import 'package:tv_project_beta_01/src/model/channel_model.dart';
import 'package:tv_project_beta_01/src/utils/ux_random_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  late String inputChannel = '';

  Widget build(BuildContext context) {
    final channelController =
        Provider.of<ChannelController>(context, listen: false);
    List<ChannelModel> list = channelController.channelSearch(
        channelController.listChannel, inputChannel);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Buscar Canal'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Digite um Canal para buscar:'),
                  keyboardType: TextInputType.text,
                  onSubmitted: (value) {
                    setState(() {
                      inputChannel = value.toString();
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              child: inputChannel == ''
                  ? null
                  : Column(
                      children: [
                        list.isEmpty
                            ? Container(
                                color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.error,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Nenhum Canal foi encontrado.',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ))
                            : Expanded(
                                child: ListView.builder(
                                  itemCount: list.length,
                                  itemBuilder: ((context, index) {
                                    var element = list[index];
                                    return Card(
                                      elevation: 2,
                                      child: ListTile(
                                        subtitle: Text(
                                          element.about,
                                          style: const TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        title: Text(
                                          element.title,
                                        ),
                                        trailing:
                                            Image.network(element.logoImage),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

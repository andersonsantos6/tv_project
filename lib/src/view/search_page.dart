import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_project_beta_01/src/components/list_channels.dart';
import 'package:tv_project_beta_01/src/controller/channels_controller.dart';
import 'package:tv_project_beta_01/src/model/channel_model.dart';
import 'package:tv_project_beta_01/src/utils/ux_colors.dart';
import 'package:tv_project_beta_01/src/utils/ux_random_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = CustomColors();
    final channelController =
        Provider.of<ChannelController>(context, listen: false);
    List<ChannelModel> list = channelController.channelSearch(
        channelController.listChannel, _controller.text);

    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: color.primaryColor(),
          appBar: AppBar(
            backgroundColor: color.primaryColor(),
            title: const Text('Buscar Canal'),
          ),
          body: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: 'Digite um canal para buscar:'),
                    keyboardType: TextInputType.text,
                    controller: _controller,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  child: _controller.text == ''
                      ? Center(
                          child: Container(
                          height: 300,
                          child: Image.asset(
                              'lib/src/assets/searchPage/search.png'),
                        ))
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
                                            'Nenhum canal foi encontrado.',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ))
                                : Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Encontrado(s) ${list.length} canais:',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                            itemCount: list.length,
                                            itemBuilder: ((context, index) {
                                              var element = list[index];
                                              return Card(
                                                elevation: 2,
                                                child: ListTile(
                                                  onTap: () =>
                                                      channelController.getPage(
                                                          context,
                                                          list[index],
                                                          '/player'),
                                                  subtitle: Text(
                                                    element.about,
                                                    style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  title: Text(
                                                    element.title,
                                                  ),
                                                  trailing: Image.network(
                                                      element.logoImage),
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

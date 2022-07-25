import 'dart:convert';
import 'dart:math';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tv_project_beta_01/src/model/channel_model.dart';
import 'package:http/http.dart' as http;
import 'package:tv_project_beta_01/src/view/home_page.dart';
import 'package:video_player/video_player.dart';

class ChannelController with ChangeNotifier {
  late String _token;
  late List<ChannelModel> listChannel = [];
  ChannelController(this._token, this.listChannel);
  Future<void> getChannels() async {
    final response = await http.get(Uri.parse(
        'https://tvproject-247d8-default-rtdb.firebaseio.com/channels.json?auth=${_token}'));

    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach(
      (key, channelData) {
        listChannel.add(ChannelModel(
          logoImage: channelData['logoImage'],
          category: channelData['category'],
          title: channelData['title'],
          about: channelData['about'],
          urlStream: channelData['urlStream'],
        ));
        notifyListeners();
      },
    );
  }

  getPage(BuildContext context, Object? args, String page) {
    return Navigator.of(context).pushNamed(page, arguments: args);
  }

  List<ChannelModel> channelFilter(
      List<ChannelModel> listChannel, String value) {
    return listChannel
        .where((ch) => ch.category == value.toLowerCase())
        .toList();
  }

  List<ChannelModel> channelSearch(
      List<ChannelModel> listChannel, String value) {
    return listChannel
        .where(
          (ch) =>
              ch.title.toLowerCase().contains(value.toString().toLowerCase()),
        )
        .toList();
  }
}

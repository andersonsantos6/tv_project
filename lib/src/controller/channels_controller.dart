import 'dart:convert';
import 'dart:math';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tv_project_beta_01/src/model/channel_model.dart';
import 'package:http/http.dart' as http;
import 'package:tv_project_beta_01/src/model/feed_model.dart';
import 'package:tv_project_beta_01/src/view/home_page.dart';

class ChannelController with ChangeNotifier {
  final List<FeedModel> listFeed = [];
  final List<ChannelModel> listChannel = [];

  Future<void> getChannels() async {
    final response = await http.get(Uri.parse(
        'https://tvproject-247d8-default-rtdb.firebaseio.com/channels.json'));

    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((key, channelData) {
      listChannel.add(ChannelModel(
        logoImage: channelData['logoImage'],
        category: channelData['category'],
        title: channelData['title'],
        about: channelData['about'],
        urlStream: channelData['urlStream'],
      ));
      notifyListeners();
    });
  }

  // Future<void> getFeed() async {
  //   final response = await http.get(Uri.parse(
  //       'https://tvproject-247d8-default-rtdb.firebaseio.com/feed.json'));

  //   if (response.body == 'null') return;
  //   Map<String, dynamic> data = jsonDecode(response.body);

  //   data.forEach((key, feedData) {
  //     listFeed.add(FeedModel(
  //       image: feedData['image'],
  //       title: feedData['title'],
  //       text: feedData['text'],
  //     ));
  //     notifyListeners();
  //     print(response.body);
  //   });
  // }

  getPage(BuildContext context, Object? args, String page) {
    Navigator.of(context).pushNamed(page, arguments: args);
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
  //   Future<void> loadProducts() async {
  //   _items.clear();
  //   final response =
  //       await http.get(Uri.parse('${Constants.PRODUCT_BASE_URL}.json'));
  //   print(jsonDecode(response.body));
  //   if (response.body == 'null') return;
  //   Map<String, dynamic> data = jsonDecode(response.body);
  //   data.forEach(
  //     (productId, productData) {
  //       _items.add(
  //         Product(
  //           id: productId,
  //           description: productData['description'],
  //           imageUrl: productData['imageUrl'],
  //           isFavotrite: productData['isFavorite'],
  //           price: productData['price'],
  //           name: productData['name'],
  //         ),
  //       );
  //     },
  //   );
  //   notifyListeners();
  // }
}

// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable {
  String id;
  String symbol;
  String name;
  String hashing_algorithm;
  String image;
  LinksEntity links;

  CoinEntity({
    required this.id,
    required this.symbol,
    required this.name,
    required this.hashing_algorithm,
    required this.image,
    required this.links,
  });

  @override
  List<Object?> get props =>
      [id, symbol, name, hashing_algorithm, image, links];
}

class LinksEntity {
  List<String> homepage;
  List<String> blockchain_site;
  List<String> official_forum_url;
  List<String> github;

  String twitter_screen_name;
  String facebook_username;
  String telegram_channel_identifier;
  String subreddit_url;

  LinksEntity({
    required this.homepage,
    required this.blockchain_site,
    required this.official_forum_url,
    required this.github,
    required this.twitter_screen_name,
    required this.facebook_username,
    required this.telegram_channel_identifier,
    required this.subreddit_url,
  });
}

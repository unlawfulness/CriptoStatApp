import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';

class LinksModel extends LinksEntity {
  LinksModel(
      {required List<String> homepage,
      required List<String> blockchain_site,
      required List<String> official_forum_url,
      required List<String> github,
      required String twitter_screen_name,
      required String facebook_username,
      required String telegram_channel_identifier,
      required String subreddit_url})
      : super(
            homepage: homepage,
            blockchain_site: blockchain_site,
            official_forum_url: official_forum_url,
            github: github,
            twitter_screen_name: twitter_screen_name,
            facebook_username: facebook_username,
            telegram_channel_identifier: telegram_channel_identifier,
            subreddit_url: subreddit_url);

  factory LinksModel.fromJson(Map<String, dynamic> json) {
    return LinksModel(
        homepage: (json['links']['homepage'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        blockchain_site: (json['links']['blockchain_site'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        official_forum_url:
            (json['links']['official_forum_url'] as List<dynamic>)
                .map((e) => e as String)
                .toList(),
        github: (json['links']['repos_url']['github'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        twitter_screen_name: json['links']['twitter_screen_name'],
        facebook_username: json['links']['facebook_username'],
        telegram_channel_identifier: json['links']
            ['telegram_channel_identifier'],
        subreddit_url: json['links']['subreddit_url']);
  }

  Map<String, dynamic> toJson(){
    
  }
}

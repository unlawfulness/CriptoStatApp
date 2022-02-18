class CoinEntity{
  String id;
  String symbol;
  String name;
  String hashing_algorithm;
  String image;
  Links links;


}

class LinksEntity{
  List<String> homepage;  
  List<String> blockchain_site;
  List<String> official_forum_url;
  List<String> github;

  String twitter_screen_name;
  String facebook_username;
  String telegram_channel_identifier;
  String subreddit_url;

  

}
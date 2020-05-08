
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;


class RSSNews extends StatefulWidget {
  RSSNews() : super();
  final String title = 'RSSS Feed';
  
  @override
  RSSNewsState createState() => RSSNewsState();
 
}

class RSSNewsState extends State<RSSNews> {
  //gooogle news rss
   static const String FEED_URL = 'https://rss.app/feeds/OLB9t0uyOfCX3xGw.xml';
   RssFeed _feed;
   String _title;

  static const String loadingFeedMsg = 'Loading Feed..';
  static const String feedLoadErrorMsg = 'Error Loading Feed..';
  
  static const String feedOpenErrorMsg = 'Error Opening Feed..';

  GlobalKey<RefreshIndicatorState> _refreshKey; //

  updateTitle(title){
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed){
    setState(() {
      _feed = feed;
    });
  }

  //URL launcher pluggin
  Future<void> openFeed(String url) async {
    if(await canLaunch(url)){
      await launch(
        url,
        forceSafariVC: true, 
        forceWebView: false, //opens in app 
      );
      return;
    }
    updateTitle(feedOpenErrorMsg); //displays error if url cant be launched
  }


  //checks if feed is loaded, displays error if feed is null
  load() async{
    updateTitle(loadingFeedMsg);
    loadFeed().then((result){
      if(null == result || result.toString().isEmpty){
        updateTitle(feedLoadErrorMsg);
        return;      
        }
        //updates if feed loaded
        updateFeed(result);
        updateTitle(_feed.title);
    });
  }


  //function to get the feed
   Future<RssFeed> loadFeed() async {
     try {
       final client = http.Client();
       final response = await client.get(FEED_URL);
       return RssFeed.parse(response.body);

     } catch (e) {
       //
     }
     return null;
   }


  @override
  void initState(){
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>(); //when you try to scroll, indicates its loading
    updateTitle(widget.title); // Title RSS.app gave
    load(); // calls function to load feed
  }



  title(title){
    return Text(
      title,
      style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
subtitle(subTitle){
    return Text(
      subTitle,
      style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w100),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  rightIcon() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: Colors.grey,
      size: 30.0,
    );
  }

  // builds the list
   list() {
    return ListView.builder(
      itemCount: _feed.items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _feed.items[index];
        return ListTile( //returns widget for each row in list
          title: title(item.title),
          subtitle: subtitle(item.pubDate),
          trailing: rightIcon(), //icon to open up in browser
          contentPadding: EdgeInsets.all(5.0),
          onTap: () => openFeed(item.link), //opens url on tap
        );
      },
    );
  }

  isFeedEmpty() {
    return null == _feed || null == _feed.items;
  }


  body() {
    return isFeedEmpty()
        ? Center( // ? checks if feed is empty, if not then center is set
            child: CircularProgressIndicator(), //indicates progress is being made, tells user to wait
          )
        : RefreshIndicator(
          key: _refreshKey,
          child: list(),
          onRefresh: () => load(), //calls load on refresh
        );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        ),
        body: body(),
      );
  }
}


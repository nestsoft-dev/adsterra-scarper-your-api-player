import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
// import '../models/rssitem.dart';
import 'package:xml/xml.dart' as xml;


class RssItem {
  final String? link;
  final String? title;
  final String? pubDate;
  final String? description;

  RssItem({this.link, this.title, this.pubDate, this.description});

  factory RssItem.fromXml(xml.XmlElement element) {
    return RssItem(
      link: element.findElements('link').first.text,
      title: element.findElements('title').first.text,
      pubDate: element.findElements('pubDate').first.text,
      description: element.findElements('description').first.text,
    );
  }
}

class AdsterraFeeds extends StatefulWidget {
  @override
  _AdsterraFeedsState createState() => _AdsterraFeedsState();
}

class _AdsterraFeedsState extends State<AdsterraFeeds> {
  List<RssItem>? rssItems;

  @override
  void initState() {
    super.initState();
    fetchRssFeed();
  }

  
 Future<void> fetchRssFeed() async {
    try {
      final response =
          await http.get(Uri.parse('https://adsterra.com/blog/feed/'));
      if (response.statusCode == 200) {
        final document = xml.XmlDocument.parse(response.body);
        final items = document.findAllElements('item');

        final List<RssItem> parsedItems = items.map((item) {
          return RssItem.fromXml(item);
        }).toList();

        setState(() {
          rssItems = parsedItems;
        });
      }
    } catch (e) {
      print('Error fetching RSS feed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Adsterra RSS Feed'),
        ),
        body: rssItems == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: rssItems!.length,
                itemBuilder: (ctx, index) {
                  final item = rssItems![index];
                  return ListTile(
                    title: Text(item.title ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.pubDate ?? ''),
                        Text(item.description ?? ''),
                      ],
                    ),
                    onTap: () {
                      launchURL(item.link);
                    },
                  );
                },
              ),
      ),
    );
  }

  void launchURL(String? url) async {
    if (url != null && await canLaunch(url)) {
      await launch(url);
    }
  }
}


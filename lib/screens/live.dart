// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:youtube_api/youtube_api.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YT_API {
//   String id;
//   String title;
//   String channelTitle;
//   Map<dynamic, dynamic> thumbnail;

//   YT_API({this.id, this.title, this.channelTitle, this.thumbnail});

//   factory YT_API.fromMap(Map<dynamic, dynamic> map) {
//     return YT_API(
//       id: map['id'],
//       title: map['title'],
//       channelTitle: map['channelTitle'],
//       thumbnail: map['thumbnail'],
//     );
//   }
// }

// class LivePage extends StatefulWidget {
//   const LivePage({super.key});

//   @override
//   State<LivePage> createState() => _LivePageState();
// }

// class _LivePageState extends State<LivePage> {
//   late List<YT_API> _playlistItems;
//   YoutubePlayerController? _playerController;
//   final String apiKey = 'YOUR_YOUTUBE_API_KEY';
  
//   @override
//   void initState() {
//       fetchPlaylistItems();
//     super.initState();
//   }

//   Future<void> fetchPlaylistItems() async {
//     try {
//       var httpClient = http.Client();
//       var ytApi = YoutubeAPI(apiKey, httpClient: httpClient);
//       var playlistItems = await ytApi.getPlaylistItems(
//           'PLAYLIST_ID'); // Replace with your YouTube playlist ID

//       setState(() {
//         _playlistItems = playlistItems;
//       });
//     } catch (e) {
//       print('Error fetching playlist items: $e');
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('YouTube Playlist'),
//       ),
//       body: _playlistItems == null
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: _playlistItems.length,
//               itemBuilder: (context, index) {
//                 var playlistItem = _playlistItems[index];
//                 return ListTile(
//                   leading:
//                       Image.network(playlistItem.thumbnail['default']['url']),
//                   title: Text(playlistItem.title),
//                   subtitle: Text(playlistItem.channelTitle),
//                   onTap: () {
//                     playVideo(playlistItem.id);
//                   },
//                 );
//               },
//             ),
//     );
//   }

//   void playVideo(String videoId) {
//     setState(() {
//       _playerController = YoutubePlayerController(
//         initialVideoId: videoId,
//         flags: YoutubePlayerFlags(
//           autoPlay: true,
//         ),
//       );
//     });

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           appBar: AppBar(),
//           body: Center(
//             child: YoutubePlayer(
//               controller: _playerController!,
//               showVideoProgressIndicator: true,
//               progressIndicatorColor: Colors.amber,
//               progressColors: ProgressBarColors(
//                 playedColor: Colors.amber,
//                 handleColor: Colors.amberAccent,
//               ),
//               onReady: () {
//                 // Do something when the player is ready.
//               },
//               onEnded: (data) {
//                 // Do something when the video ends.
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

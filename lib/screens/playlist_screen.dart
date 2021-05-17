import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';
import 'package:spotify_ui/widgets/widgets.dart';

class PlayListScreen extends StatefulWidget {
  final Playlist playlist;
  const PlayListScreen({
    Key? key,
    required this.playlist,
  }) : super(key: key);
  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.chevron_left, size: 28),
                ),
              ),
              SizedBox(width: 16),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.chevron_right, size: 28),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {},
            icon: Icon(
              Icons.account_circle_outlined,
              size: 30,
            ),
            label: Text('Saikat Rahman'),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 30,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFAF1018),
              Theme.of(context).backgroundColor,
            ],
            stops: [0, 0.3],
          ),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 60,
            ),
            children: [
              PlayListHeader(playlist: widget.playlist),
              TracksList(tracks: widget.playlist.songs),
            ],
          ),
        ),
      ),
    );
  }
}

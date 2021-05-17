import 'package:flutter/material.dart';
import 'package:spotify_ui/models/current_track.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            _TrackInfo(),
            Spacer(),
            _PlayerControls(),
            Spacer(),
            if (MediaQuery.of(context).size.width > 800) _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 4),
            Text(
              selected.artist,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.grey[300],
                    fontSize: 12,
                  ),
            ),
          ],
        ),
        SizedBox(width: 12),
        IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(),
              icon: Icon(Icons.shuffle),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.only(),
              icon: Icon(Icons.skip_previous_outlined),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.only(),
              icon: Icon(Icons.play_circle_outline),
              iconSize: 34,
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.only(),
              icon: Icon(Icons.skip_next_outlined),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.only(),
              icon: Icon(Icons.repeat),
              iconSize: 20,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Text('0:00', style: Theme.of(context).textTheme.caption),
            SizedBox(width: 8),
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            SizedBox(width: 8),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.devices_outlined),
          iconSize: 20,
          onPressed: () {},
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.volume_up_outlined),
              onPressed: () {},
            ),
            Container(
              height: 5,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.fullscreen_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}

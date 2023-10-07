import 'package:flutter/material.dart';
import 'package:spotify_ui_prerna/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;
  const PlaylistHeader({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0,),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLAYLIST',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12.0),              ),
                  const SizedBox(height: 12.0,),
                  Text(playlist.name,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                   const SizedBox(height: 16.0),
                      Text(
                        playlist.description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                  const SizedBox(height: 16.0,),
                   Text(
                        'Created by ${playlist.creator} • ${playlist.songs.length} songs, ${playlist.duration}',
                        style: Theme.of(context).textTheme.titleMedium,
                  ),
                 
                ],
              ),
            ),
          ],
        ),
         const SizedBox(height: 20.0),
              _PlayListButtons(followers: playlist.followers),
      ],
    );
  }
}

class _PlayListButtons extends StatelessWidget {
  final String followers;
  const _PlayListButtons({required this.followers});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 48.0,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
            backgroundColor: Theme.of(context).hintColor,
            textStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(
              fontSize: 12.0,
              letterSpacing: 2.0,
              color: Colors.white,
            ),
          ),
          onPressed: (){},
          child: const Text('PLAY',
          style: TextStyle(
            color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        IconButton(
          onPressed:(){},
          icon: const Icon(Icons.favorite_border),
          iconSize: 30.0,
        ),
        IconButton(
          onPressed:(){},
          icon: const Icon(Icons.more_horiz),
          iconSize: 30.0,
        ),
        const Spacer(),
        Text('FOLLOWERS\n$followers',
        style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12.0),
        ),
      ],
    );
  }
}
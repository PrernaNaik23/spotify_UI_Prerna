import 'package:flutter/material.dart';
import 'package:spotify_ui_prerna/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: double.infinity,
                width: 280.0,
                color: Theme.of(context).primaryColor,
                child: Column(children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset('assets/spotify_logo.png',
                        height: 55.0,
                        filterQuality: FilterQuality.medium,
                        ),
                      ),
                    ],
                  ),
                  _SideMenuIconTab(
                    iconData: Icons.home,
                    title: 'Home',
                    onTap: () {},
                  ),
                   _SideMenuIconTab(
                    iconData: Icons.search,
                    title: 'Search',
                    onTap: () {},
                  ),
                   _SideMenuIconTab(
                    iconData: Icons.audiotrack,
                    title: 'Radio',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  _LibraryPlaylists(),
                ]),
              );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  const _SideMenuIconTab({
    Key? key, required this.iconData, required this.title, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title:Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis,
      ) ,
      onTap:onTap,
    );
  }
}

class _LibraryPlaylists extends StatefulWidget {
  @override
  State<_LibraryPlaylists> createState() => __LibraryPlaylistsState();
}

class __LibraryPlaylistsState extends State<_LibraryPlaylists> {
  ScrollController? _scrollController;
  
  @override
  void initState(){
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
    return Expanded(
      child: Scrollbar(
        thumbVisibility:true,
        controller: _scrollController,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text('YOUR LIBRARY',
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary.map(
                  (e) => ListTile(
                    dense:true,
                    title: Text(
                      e,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: (){},
                  ),
                ).toList(),
              ],
            ),
            const SizedBox(height: 24.0,),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text('PLAYLISTS',
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists.map(
                  (e) => ListTile(
                    dense:true,
                    title: Text(
                      e,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: (){},
                  ),
                ).toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
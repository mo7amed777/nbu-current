import 'package:flutter/material.dart';
import 'package:northern_border_university/view/widgets/media_card.dart';

class MediaCenter extends StatefulWidget {
  const MediaCenter({Key? key}) : super(key: key);

  @override
  State<MediaCenter> createState() => _MediaCenterState();
}

class _MediaCenterState extends State<MediaCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MediaCard(
            title: 'University In the Media',
            subtitle: 'View University In the Media',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO Navigate to NBU in Media screen
            },
          ),
          MediaCard(
            title: 'University News',
            subtitle: 'View all University News',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO Navigate to News screen
            },
          ),
          MediaCard(
            title: 'Events',
            subtitle: 'View all Events',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO Navigate to Events screen
            },
          ),
          MediaCard(
            title: 'Academic Calendar',
            subtitle: 'View Academic Calendar',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO implement Academic Calendar screen
            },
          ),
          MediaCard(
            title: 'Photo Gallery',
            subtitle: 'View Photo Gallery',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO Navigate to Photo Gallery screen
            },
          ),
          MediaCard(
            title: 'Video Gallery',
            subtitle: 'View Video Gallery',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO Navigate to Video Gallery screen
            },
          ),
          MediaCard(
            title: 'Open Data',
            subtitle: 'View all Open Data',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO implement Open Data screen
            },
          ),
          MediaCard(
            title: 'Documents Library',
            subtitle: 'View Documents Library',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO implement Documents Library screen
            },
          ),
          MediaCard(
            title: 'Announcements',
            subtitle: 'View all Announcements',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO Navigate to Announcements screen
            },
          ),
        ],
      ),
    );
  }
}

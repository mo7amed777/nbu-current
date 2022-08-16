import 'package:flutter/material.dart';
import 'package:northern_border_university/view/widgets/appbar.dart';
import 'package:northern_border_university/view/widgets/media_card.dart';

class VicePresidencies extends StatefulWidget {
  const VicePresidencies({Key? key}) : super(key: key);

  @override
  State<VicePresidencies> createState() => _VicePresidenciesState();
}

class _VicePresidenciesState extends State<VicePresidencies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Appbar(
            title: 'The Vice Presidencies',
            onSearch: () {},
            search: Icons.search,
          ),
          MediaCard(
            title: 'The Vice Presidency',
            subtitle: 'More ...',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {},
          ),
          MediaCard(
            title: 'Delete',
            subtitle: 'More ...',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO Navigate to News screen
            },
          ),
          MediaCard(
            title: 'The Vice Presidency of Academic Affairs',
            subtitle: 'More ...',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO Navigate to Events screen
            },
          ),
          MediaCard(
            title:
                'The Vice Presidency of Graduate Studies and Scientific Research',
            subtitle: 'More ...',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO implement Academic Calendar screen
            },
          ),
          MediaCard(
            title:
                'The Vice Presidency of Development, Quality, and Community Service',
            subtitle: 'More ...',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO Navigate to Photo Gallery screen
            },
          ),
          MediaCard(
            title: 'The Vice Presidency of Female Students Affairs',
            subtitle: 'More ...',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO Navigate to Video Gallery screen
            },
          ),
          MediaCard(
            title: 'The Vice Presidency of Branches',
            subtitle: 'More ...',
            image: 'assets/images/media/placeholder.jpg',
            onTap: () {
              //TODO implement Open Data screen
            },
          ),
        ],
      ),
    );
  }
}

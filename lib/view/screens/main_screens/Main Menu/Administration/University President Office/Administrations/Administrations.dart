import 'package:flutter/material.dart';

class Administrations extends StatefulWidget {
  const Administrations({Key? key}) : super(key: key);

  @override
  State<Administrations> createState() => _AdministrationsState();
}

class _AdministrationsState extends State<Administrations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Administrations'),
      ),
    );
  }
}

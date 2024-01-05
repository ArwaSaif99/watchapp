import 'package:arwa_s_application1/presentation/iphone_13_mini_thirtythree_screen/iphone_13_mini_thirtythree_screen.dart';
import 'package:arwa_s_application1/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SellWatch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SellWatchState();
}

class _SellWatchState extends State<SellWatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Card(
        child: ListTile(
          leading: Icon(Icons.add_circle),
          title: Text('Add Watch'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Iphone13MiniThirtythreeScreen()),
            );
          },
        ),
      )),
    );
  }
}

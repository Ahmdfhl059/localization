import 'package:flutter/material.dart';
import 'package:flutter_localization/app_localization.dart';
import 'package:flutter_localization/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr(context)),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => SettingsPage()));
            },
          ),
        ],
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          children: [
            Text(
              "heloo_msg".tr(context),
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Text(
              'This text will not be translated',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify/data/data.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 5,
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                    'https://scontent.fdad7-1.fna.fbcdn.net/v/t39.30808-6/312297714_206841441768622_8737112273700475545_n.jpg?_nc_cat=109&cb=99be929b-8d691acd&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=46nZhXYszPgAX_d_biY&_nc_ht=scontent.fdad7-1.fna&oh=00_AfA9QJM062zcnOa7QpwJfQldya0FStyoUewAl6cVmB20LA&oe=65B47281'),
              ),
              title: Text('Nguyễn Nhất Vương'),
              subtitle: Text('View Profile'),
              trailing: Icon(FluentIcons.chevron_right_20_regular),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(settingOptions[index]),
                  trailing: const Icon(FluentIcons.chevron_right_20_regular),
                );
              },
              itemCount: settingOptions.length,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {},
                child: const Text('Log Out',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

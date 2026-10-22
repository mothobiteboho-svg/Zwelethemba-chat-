import 'package:flutter/material.dart';

void main() => runApp(ZweletembaApp());

class ZweletembaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zweletemba Chat 6850',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B141A),
        title: Row(
          children: [
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(
                color: Color(0xFF00A884),
                shape: BoxShape.circle,
              ),
              child: Center(child: Text('Z', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24))),
            ),
            SizedBox(width: 10),
            Text('Zweletemba Chat', style: TextStyle(color: Colors.white)),
            SizedBox(width: 6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF00A884)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('6850', style: TextStyle(color: Color(0xFF00A884), fontSize: 12)),
            ),
          ],
        ),
      ),
      body: GroupsScreen(),
    );
  }
}

class GroupsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(leading: Icon(Icons.chat, color: Colors.green), title: Text('Chats - REAL Firebase'), subtitle: Text('Molo 6850!')),
        ListTile(leading: Icon(Icons.group, color: Colors.green), title: Text('Zweletemba Groups'), subtitle: Text('Create Group')),
        ListTile(leading: Icon(Icons.emergency, color: Colors.red), title: Text('Emergency 10111')),
        ListTile(leading: Icon(Icons.local_hospital, color: Colors.blue), title: Text('Clinic B015')),
        ListTile(leading: Icon(Icons.work, color: Colors.orange), title: Text('Jobs 6850')),
      ],
    );
  }
}

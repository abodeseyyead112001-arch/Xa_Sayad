import 'package:flutter/material.dart';

void main() => runApp(XaSayadApp());

class XaSayadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xa_Sayad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final rooms = [
    {'name': 'غرفة العامية 😎', 'users': 128},
    {'name': 'غرفة الطرب 🎤', 'users': 85},
    {'name': 'غرفة الدردشة 💬', 'users': 210},
    {'name': 'VIP Lounge 👑', 'users': 32},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Xa_Sayad'), backgroundColor: Colors.deepPurple, foregroundColor: Colors.white, centerTitle: true),
      body: _index == 0 ? buildRooms() : _index == 1 ? buildWallet() : buildAdmin(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i)=>setState(()=>_index=i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'الغرف'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'المحفظة'),
          BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings), label: 'الادمن'),
        ],
      ),
    );
  }

  Widget buildRooms() {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: rooms.length,
      itemBuilder: (c,i){
        final r = rooms[i];
        return Card(child: ListTile(leading: CircleAvatar(child: Icon(Icons.mic)), title: Text(r['name'] as String), subtitle: Text('${r['users']} متواجد'), trailing: ElevatedButton(onPressed: (){}, child: Text('دخول'))));
      },
    );
  }

  Widget buildWallet() {
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.wallet, size:80, color: Colors.deepPurple), SizedBox(height:16), Text('رصيدك: 1,250 كوينز', style: TextStyle(fontSize:22, fontWeight: FontWeight.bold)), ElevatedButton(onPressed: (){}, child: Text('شحن'))]));
  }

  Widget buildAdmin() {
    return ListView(padding: EdgeInsets.all(16), children: [Card(child: ListTile(title: Text('المتواجدون: 455'), leading: Icon(Icons.people))), Card(child: ListTile(title: Text('الأرباح: €128'), leading: Icon(Icons.euro))), Card(child: ListTile(title: Text('إدارة الغرف')))]);
  }
}

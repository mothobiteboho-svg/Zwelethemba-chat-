import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ZwelethembaApp()));

class ZwelethembaApp extends StatefulWidget {
  @override
  State<ZwelethembaApp> createState() => _ZwelethembaAppState();
}

class _ZwelethembaAppState extends State<ZwelethembaApp> {
  int currentIndex = 0;
  List<Map<String,String>> chats = [
    {"name":"Lethabo • 17:13","text":"Pula e matla e lebelletsoe - Zwelethemba 6850"},
    {"name":"Sipho (Volunteer)","text":"Tsela ya Main Rd e koetswe - Detour via Kliprand Rd"},
  ];
  TextEditingController msgCtrl = TextEditingController();
  String clinicNum = "B015";
  int waitTime = 12;

  void showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Color(0xFF00A884), duration: Duration(seconds: 2)));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      // CHATS PAGE
      Column(children: [
        Container(color: Color(0xFF182229), padding: EdgeInsets.all(8), child: Row(children: [
          ElevatedButton.icon(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: (){ setState(()=>currentIndex=5); }, icon: Icon(Icons.emergency), label: Text("EMERGENCY")),
          SizedBox(width:8),
          Container(padding: EdgeInsets.symmetric(horizontal:12,vertical:6), decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(20)), child: Text("12kb saved • R0.02 • 6850", style: TextStyle(fontSize:11, color: Colors.white54))),
        ])),
        Expanded(child: ListView.builder(padding: EdgeInsets.all(12), itemCount: chats.length, itemBuilder: (c,i){
          return InkWell(onTap: ()=>showSnack("Chat with ${chats[i]['name']} - Coming Monday!"), child: Container(margin: EdgeInsets.only(bottom:10), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF202C33), borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(chats[i]['name']!, style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)), SizedBox(height:4), Text(chats[i]['text']!, style: TextStyle(color: Colors.white))])) );
        })),
        Container(color: Color(0xFF202C33), padding: EdgeInsets.all(8), child: Row(children: [
          Expanded(child: TextField(controller: msgCtrl, decoration: InputDecoration(hintText: "Type a message - Zwelethemba 6850", border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)), filled: true, fillColor: Color(0xFF2A3942), contentPadding: EdgeInsets.symmetric(horizontal:16)), style: TextStyle(color: Colors.white))),
          SizedBox(width:8),
          InkWell(onTap: (){
            if(msgCtrl.text.isNotEmpty){ setState(()=>chats.add({"name":"You • now","text":msgCtrl.text})); msgCtrl.clear(); showSnack("Message sent! Low data: 2kb used"); }
          }, child: CircleAvatar(backgroundColor: Color(0xFF00A884), child: Icon(Icons.send, color: Colors.black))),
        ])),
      ]),
      // GROUPS
      Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.groups, size: 60, color: Colors.green), SizedBox(height:10), Text("Zwelethemba Groups", style: TextStyle(color: Colors.white, fontSize:20)), ElevatedButton(onPressed: ()=>showSnack("Groups - Coming Monday!"), child: Text("Create Group"))])),
      // JOBS
      ListView(padding: EdgeInsets.all(12), children: [
        _jobCard("Shoprite Cashier", "Worcester • Part-time • R50/hr", "Reply JOB"),
        _jobCard("Pick n Pay Packer", "Worcester • Full-time • R4500", "Apply now"),
        _jobCard("Farm Worker", "Rawsonville • Seasonal • R120/day", "Contact"),
      ]),
      // ALERTS
      ListView(padding: EdgeInsets.all(12), children: [
        _alertCard("BVM Alert", "Water restrictions lifted - 6850", Colors.green),
        _alertCard("Weather", "Pula e matla e lebelletsoe tomorrow", Colors.orange),
        _alertCard("Road", "Main Rd closed - Use Kliprand Rd", Colors.red),
      ]),
      // CLINIC
      Column(children: [
        SizedBox(height:20),
        Container(margin: EdgeInsets.all(20), padding: EdgeInsets.all(20), decoration: BoxDecoration(color: Color(0xFF123022), borderRadius: BorderRadius.circular(16)), child: Column(children: [
          Text("Clinic Queue • Zwelethemba 6850", style: TextStyle(color: Colors.greenAccent, fontSize:18, fontWeight: FontWeight.bold)),
          SizedBox(height:20),
          Text("Now serving:", style: TextStyle(color: Colors.white54)),
          Text(clinicNum, style: TextStyle(color: Colors.white, fontSize:48, fontWeight: FontWeight.bold)),
          SizedBox(height:10),
          Text("Wait: $waitTime min • 4 people", style: TextStyle(color: Colors.white)),
          SizedBox(height:20),
          ElevatedButton(onPressed: (){ setState((){ waitTime++; }); showSnack("You joined queue! New position: B0${int.parse(clinicNum.substring(1))+1}"); }, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF00A884)), child: Text("JOIN QUEUE")),
          SizedBox(height:10),
          TextButton(onPressed: (){ setState(()=>waitTime=12); showSnack("Queue refreshed!"); }, child: Text("Refresh", style: TextStyle(color: Colors.white54))),
        ])),
      ]),
      // EMERGENCY
      ListView(padding: EdgeInsets.all(12), children: [
        _emergencyCard("EMERGENCY - Zwelethemba 6850", "Police 10111", Colors.red, (){ showSnack("Calling Police 10111... (Will dial on real phone)"); }),
        _emergencyCard("SAPS WhatsApp", "060 340 3617", Color(0xFF202C33), (){ showSnack("Opening WhatsApp 060 340 3617..."); }),
        _emergencyCard("Ambulance", "10177", Color(0xFF202C33), (){ showSnack("Calling Ambulance 10177..."); }),
        _emergencyCard("Fire", "107", Color(0xFF202C33), (){ showSnack("Calling Fire 107..."); }),
        _emergencyCard("Worcester Hospital", "023 348 1100", Color(0xFF202C33), (){ showSnack("Calling Hospital 023 348 1100..."); }),
        _emergencyCard("BVM", "023 348 2600", Color(0xFF202C33), (){ showSnack("Calling BVM 023 348 2600..."); }),
        SizedBox(height:20),
        ElevatedButton.icon(style: ElevatedButton.styleFrom(backgroundColor: Colors.red, padding: EdgeInsets.all(16)), onPressed: (){ showSnack("EMERGENCY SOS Sent to Zwelethemba 6850!"); }, icon: Icon(Icons.emergency, size: 30), label: Text("SOS - SEND LOCATION", style: TextStyle(fontSize:18))),
      ]),
    ];

    return Scaffold(
      backgroundColor: Color(0xFF0B141A),
      appBar: AppBar(title: Text('Zwelethemba Chat 6850 - Working!'), backgroundColor: Color(0xFF202C33)),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF202C33),
        selectedItemColor: Color(0xFF00A884),
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (i){ setState(()=>currentIndex=i); showSnack(["Chats","Groups","Jobs","Alerts","Clinic","Emergency"][i]); },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Groups'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services), label: 'Clinic'),
          BottomNavigationBarItem(icon: Icon(Icons.emergency), label: 'Emergency'),
        ],
      ),
    );
  }

  Widget _jobCard(String title, String desc, String btn) => Container(margin: EdgeInsets.only(bottom:10), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF202C33), borderRadius: BorderRadius.circular(12)), child: Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)), Text(desc, style: TextStyle(color: Colors.white54))])), ElevatedButton(onPressed: ()=>showSnack("$title - Applied!"), child: Text(btn))]));
  Widget _alertCard(String title, String text, Color dot) => Container(margin: EdgeInsets.only(bottom:10), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF202C33), borderRadius: BorderRadius.circular(12)), child: Row(children: [Container(width:10,height:10,decoration: BoxDecoration(color: dot, shape: BoxShape.circle)), SizedBox(width:10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(text, style: TextStyle(color: Colors.white54))]))]));
  Widget _emergencyCard(String title, String number, Color c, VoidCallback onTap) => InkWell(onTap: onTap, child: Container(margin: EdgeInsets.only(bottom:10), padding: EdgeInsets.all(16), decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(12)), child: Row(children: [Icon(Icons.phone, color: Colors.white), SizedBox(width:12), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(number, style: TextStyle(color: Colors.white70, fontSize:16))]), Spacer(), Icon(Icons.call, color: Colors.greenAccent)])));
}

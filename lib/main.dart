import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,home:ZwelethembaChat()));
class ZwelethembaChat extends StatelessWidget{
@override
Widget build(BuildContext c){
return Scaffold(
backgroundColor: Color(0xFF0B141A),
appBar: AppBar(title: Text('Zwelethemba Chat 6850'),backgroundColor: Color(0xFF202C33)),
body: ListView(padding: EdgeInsets.all(12),children:[
Container(padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Color(0xFF5C1A1A),borderRadius:BorderRadius.circular(12)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('EMERGENCY - Zwelethemba 6850',style:TextStyle(color:Colors.redAccent,fontWeight:FontWeight.bold)),SizedBox(height:6),Text('Police 10111\nSAPS WhatsApp 060 340 3617\nAmbulance 10177\nFire 107\nWorcester Hospital 023 348 1100\nBVM 023 348 2600',style:TextStyle(color:Colors.white))])),
SizedBox(height:10),
Container(padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Color(0xFF123022),borderRadius:BorderRadius.circular(12)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Clinic Queue • B015 - Zwelethemba 6850',style:TextStyle(color:Colors.greenAccent,fontWeight:FontWeight.bold)),Text('Now serving: B015\nWait: 12 min',style:TextStyle(color:Colors.white))])),
SizedBox(height:10),
Container(padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Color(0xFF202C33),borderRadius:BorderRadius.circular(12)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Lethabo • 17:13',style:TextStyle(color:Colors.greenAccent,fontWeight:FontWeight.bold)),Text('Pula e matla - Zwelethemba Chat - 11 Languages',style:TextStyle(color:Colors.white))])),
SizedBox(height:20),
ElevatedButton(onPressed:(){},style:ElevatedButton.styleFrom(backgroundColor:Color(0xFF00A884)),child:Text('Zwelethemba Chat Working! 6850'))
]),
bottomNavigationBar: BottomNavigationBar(backgroundColor:Color(0xFF202C33),selectedItemColor:Color(0xFF00A884),unselectedItemColor:Colors.white54,type:BottomNavigationBarType.fixed,items:[
BottomNavigationBarItem(icon:Icon(Icons.chat),label:'Chats'),
BottomNavigationBarItem(icon:Icon(Icons.groups),label:'Groups'),
BottomNavigationBarItem(icon:Icon(Icons.work),label:'Jobs'),
BottomNavigationBarItem(icon:Icon(Icons.notifications),label:'Alerts'),
BottomNavigationBarItem(icon:Icon(Icons.medical_services),label:'Clinic'),
BottomNavigationBarItem(icon:Icon(Icons.emergency),label:'Emergency'),
]),
);
}
}

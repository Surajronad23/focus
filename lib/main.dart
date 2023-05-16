import 'dart:convert';

import 'package:flutter/material.dart';

import 'data.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FocusNode myfocus = FocusNode(); //create focus node

  @override
  Widget build(BuildContext context) {

    var jsonData=[
      {
        "id": "0001",
        "type": "donut",
        "name": "Cake",
        "ppu": 0.55,
        "batters": {
          "batter": [
            {
              "id": "1001",
              "type": "Regular"
            },
            {
              "id": "1002",
              "type": "Chocolate"
            },
            {
              "id": "1003",
              "type": "Blueberry"
            }
          ]
        },
        "topping": [
          {
            "id": "5001",
            "type": "None"
          },
          {
            "id": "5002",
            "type": "Glazed"
          },
          {
            "id": "5005",
            "type": "Sugar"
          },
          {
            "id": "5007",
            "type": "Powdered Sugar"
          }
        ]
      },
      {
        "id": "0002",
        "type": "donut",
        "name": "Cake",
        "ppu": 0.55,
        "batters": {
          "batter": [
            {
              "id": "1001",
              "type": "Blueberry"
            }
          ]
        },
        "topping": [
          {
            "id": "5001",
            "type": "None"
          },
          {
            "id": "5002",
            "type": "Glazed"
          }
        ]
      }
    ];
    var d1=jsonData[0];
    var d2=jsonData[1];
    var mapResponse;
    // mapResponse=json.decode(jsonData.toString());

  // List<data> datalist;
    var l1,l2,k1,k2,t1,t2;
    l1=d1["batters"];
    k1=l1["batter"];

    var batters1=[];

    batters1.add(k1[0]['type']);
    batters1.add(k1[1]['type']);
    batters1.add(k1[2]['type']);

    t1=d1["topping"];
    var toppings1="";
    toppings1+=t1[0]['type'];
    toppings1+=",";
    toppings1+=t1[1]['type'];
    toppings1+=",";
    toppings1+=t1[2]['type'];
    toppings1+=",";
    toppings1+=t1[3]['type'];



    print("Batters are $k1");
    print("Toppings are $t1");

    l2=d2["batters"];
    k2=l2["batter"];

    var batters2=k2[0]['type'];

    t2=d2["topping"];
    var toppings2="";
    toppings2+=t2[0]['type'];
    toppings2+=",";
    toppings2+=t2[1]['type'];

    print("Second Batters are $k2");
    print("Second Toppings are $t2");

  data a = data();
  data b = data();

  a.name=d1["name"];
  a.id=d1["id"];
  a.ppu=d1["ppu"];
  a.type=d1["type"];

  b.name=d2["name"];
  b.id=d2["id"];
  b.ppu=d2["ppu"];
  b.type=d2["type"];



    // var data11=data1['batters'];

    // var data2=jsonData[1]['batters']['batter'];


    return  Scaffold(
        appBar: AppBar(
            title: Text("Table view"),
            backgroundColor: Colors.redAccent
        ),
        body: Container(
          padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Element1"),
                Text("Batters : $batters1"),
                Text("Toppings : $toppings1"),
                Divider(),
                Text("Element2"),
                Text("Batters : $batters2"),
                Text("Toppings : $toppings2"),
                // TextField(
                //   focusNode: myfocus, //apply focus node
                // ),
                //
                // ElevatedButton(
                //     onPressed: (){
                //       myfocus.requestFocus(); //focus
                //     },
                //     child: Text("Focus on TextField")
                // ),
                //
                // ElevatedButton(
                //     onPressed: (){
                //       myfocus.unfocus(); //unfocus
                //     },
                //     child: Text("Unfocus from TextField")
                // )
                SizedBox(height: 5,),
                // Flexible(
                //       flex: 1,
                //       child: ListView.builder(itemCount: 3,
                //         itemBuilder: (context, index) {
                //         return  Table(border: TableBorder(borderRadius: BorderRadius.circular(5)),
                //           children: [
                //             TableRow(children: [
                //               Text("c"),
                //               Text("d")
                //             ]),
                //           ],);
                //       },),
                //     ),

                SizedBox(height: 50,),

                Table(border: TableBorder(borderRadius: BorderRadius.circular(5)),
                  children: [
                    TableRow(children: [Text("id"),Text("type"),Text("name"),Text("ppu"),Text("Batter"),Text("Toppings"),]),
                    TableRow(children: [Text(a.id),Text(a.type),Text(a.name),Text(a.ppu.toString()),Text("${batters1[0]}"),Text("$toppings1")]),
                    TableRow(children: [Text(a.id),Text(a.type),Text(a.name),Text(a.ppu.toString()),Text("${batters1[1]}"),Text("$toppings1")]),
                    TableRow(children: [Text(a.id),Text(a.type),Text(a.name),Text(a.ppu.toString()),Text("${batters1[2]}"),Text("$toppings1")]),
                    TableRow(children: [Text(b.id),Text(b.type),Text(b.name),Text(b.ppu.toString()),Text("${batters2}"),Text("$toppings2")]),
                  ],),

                // Flexible(
                //   child: DataTable(
                //       columns: [
                //   DataColumn(label: Text("c1")),
                //   DataColumn(label: Text("c2")),
                //   ],
                //       rows: [
                //         DataRow(cells: [
                //           DataCell(Text("d1")),
                //           DataCell(Text("d2")),
                //         ]),
                //         DataRow(cells: [
                //           DataCell(Text("d1")),
                //           DataCell(Text("d2")),
                //         ]),
                //
                //   ]
                //   ),
                // ),//data table
                // Flexible(
                //   flex: 3,
                //   child: ListView.builder(itemCount: 6,
                //     itemBuilder: (context, index) {
                //       return  DataTable(rows: [
                //         DataRow(cells: [
                //           DataCell(Text("f1"),),
                //           DataCell(Text("f2"),),
                //         ])
                //       ], columns: [
                //         DataColumn(label: Text("c1")),
                //         DataColumn(label: Text("c2")),
                //       ],);
                //     },),
                // ),//data table with listview builder
              ],
            )
        )
    );
  }

  Widget getlist(){
    return Flexible(
        fit: FlexFit.loose,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context,int index){
              return Column(
                children: [
                  Text("Element ${index} "),
                ],
              );
            }
        )
    );
  }
  
}
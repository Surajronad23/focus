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
    var listResponse=[];
    var list2=[];
    var arr=[];
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
    var d;
    var l;
    var k;
    var t;
    var to="";
    for(int i=0;i<jsonData.length;i++){
      var arr2=[];
      to="";
      d=jsonData[i];
      l= d["batters"];
      k = l["batter"];
      t=d["topping"];
      for(int j=0;j<t.length;j++)
      {
        to+=t[j]['type'];
        to+=",";
      }
      for(int j=0;j<k.length;j++){
        arr.clear();
        arr.add("${jsonData[i]["id"]}");
        arr.add("${jsonData[i]["type"]}");
        arr.add("${jsonData[i]["name"]}");
        arr.add("${jsonData[i]["ppu"].toString()}");
        arr.add("${k[j]['type']}");
        arr.add("${to}");
        arr2=arr;
        list2.add(arr2);
      }

    }

    var Response=[];

    var topps="";
    var batt=[];

    var x;
    for(int i=0;i<jsonData.length;i++){
      listResponse.add(jsonData[i]);
      x=jsonData[i]['batters'];
      Response.add(x['batter']);
      }

    for(int i=0;i<listResponse.length;i++){
       d=listResponse[i];
       l= d["batters"];
       k = l["batter"];
       t= d["topping"];
      for(int j=0;j<k.length;j++)
        {
          batt.add(k[0]['type']);
        }
      for(int j=0;j<t.length;j++)
      {
        topps+=t[j]['type'];
        topps+=",";
      }
    }
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



    // print("Batters are $k1");
    // print("Toppings are $t1");

    l2=d2["batters"];
    k2=l2["batter"];

    var batters2 =[];
    batters2.add(k2[0]['type']);

    t2=d2["topping"];
    var toppings2="";
    toppings2+=t2[0]['type'];
    toppings2+=",";
    toppings2+=t2[1]['type'];

    // print("Second Batters are $k2");
    // print("Second Toppings are $t2");

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

    print("hi");
    print(list2.toString());
    print(Response);
    print("hello");
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
                // Text("${list2.toString()}"),
                SizedBox(height: 50,),
                // Flexible(
                //     child: ListView.builder(
                //       itemCount: list2.length,
                //         itemBuilder: (context,index){
                //           return Table(
                //             children: [
                //               TableRow(children: [
                //                 Text("${list2[index][0]}"),
                //                 Text("${list2[index][1]}"),
                //                 Text("${list2[index][2]}"),
                //                 Text("${list2[index][3]}"),
                //                 Text("${list2[index][4]}"),
                //                 Text("${list2[index][5]}"),
                //               ])
                //             ],
                //           );
                //         }
                //     )
                // ),
                SizedBox(width: 2,),
                // Text(Response.toString()),
                SizedBox(width: 2,),
                Text("Table View : ",style: TextStyle(fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                Table(border: TableBorder(borderRadius: BorderRadius.circular(5)),
              children: [
                TableRow(children: [Text("id"),Text("type"),Text("name"),Text("ppu"),Text("Batter"),Text("Toppings"),]),
                ]
            ),
                Flexible(
                      flex: 14,
                      child: ListView.builder(itemCount: batters1.length,
                        itemBuilder: (context, index) {
                        return  Table(border: TableBorder(borderRadius: BorderRadius.circular(5)),
                          children: [
                            TableRow(children: [Text(a.id),Text(a.type),Text(a.name),Text(a.ppu.toString()),Text("${batters1[index]}"),Text("$toppings1")]),
                          ],);
                      },),
                    ),
                Flexible(
                  flex: 10,
                  child: ListView.builder(itemCount: batters2.length,
                    itemBuilder: (context, index) {
                      return  Table(border: TableBorder(borderRadius: BorderRadius.circular(5)),
                        children: [
                          TableRow(children: [Text(b.id),Text(b.type),Text(b.name),Text(b.ppu.toString()),Text("${batters2[index]}"),Text("$toppings2")]),
                        ],);
                    },),
                ),
                Divider(),
                // Flexible(
                //       flex: 1,
                //       child: ListView.builder(itemCount: listResponse.length,
                //         itemBuilder: (context, index1) {
                //         return Flexible(
                //           child: ListView.builder(itemCount: Response[index1].length,
                //               itemBuilder: (context, index2) {
                //             return Table(border: TableBorder(borderRadius: BorderRadius.circular(5)),
                //               children: [
                //                 TableRow(children: [Text(a.id),Text(a.type),Text(a.name),Text(a.ppu.toString()),Text("${Response[index1][index2]}"),Text("${topps}")]),
                //               ],);
                //           }),
                //         );
                //
                //       },),
                //     ),
                SizedBox(height: 5,),

                // Table(border: TableBorder(borderRadius: BorderRadius.circular(5)),
                //   children: [
                //     TableRow(children: [Text("id"),Text("type"),Text("name"),Text("ppu"),Text("Batter"),Text("Toppings"),]),
                //     TableRow(children: [Text(a.id),Text(a.type),Text(a.name),Text(a.ppu.toString()),Text("${batters1[0]}"),Text("$toppings1")]),
                //     TableRow(children: [Text(a.id),Text(a.type),Text(a.name),Text(a.ppu.toString()),Text("${batters1[1]}"),Text("$toppings1")]),
                //     TableRow(children: [Text(a.id),Text(a.type),Text(a.name),Text(a.ppu.toString()),Text("${batters1[2]}"),Text("$toppings1")]),
                //     TableRow(children: [Text(b.id),Text(b.type),Text(b.name),Text(b.ppu.toString()),Text("${batters2}"),Text("$toppings2")]),
                //   ],),
                Divider(),
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
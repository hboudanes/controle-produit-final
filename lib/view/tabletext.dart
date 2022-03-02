import 'dart:math';


import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

// class DataTableDemo extends StatelessWidget {
//   var size, width;

//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     width = size.width;
//     return Scaffold(
//       body: Column(
//         children: [
//         SizedBox(
//           height: 100,
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
//           height: 40,
//           child: Row(
//             children: [
//               Container(

//                 width: width * 0.20,
//                 height: double.infinity,
//                 decoration: BoxDecoration(
//                     border: Border(
//                         right: BorderSide(color: Colors.black, width: 8))),
//                 child: Center(child: Text('Date de productiion')),
//               ),
//               Container(

//                 width: width * 0.55,

//                 child:Center(child: Text('suivi qualité prouit fini')),
//               ),
//               Container(

//                 height: double.infinity,
//                   width: width * 0.22,
//                   padding: EdgeInsets.symmetric(horizontal: 5),
//                   decoration: BoxDecoration(
//                     border: Border(
//                         left: BorderSide(color: Colors.black, width: 8))),

//                 child:Center(child: Text('S.Produit')),
//               )
//             ],
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 66, 167, 172),
//           ),
//           height: 160.2,
//           // color: Colors.pink,
//           width: double.infinity,
//           child: Row(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     border: Border(
//                         right: BorderSide(color: Colors.white, width: 8))),
//                 width: width * 0.20,
//                 height: double.infinity,
//                 // color: Colors.red,
//                 child: Center(
//                     child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("20/30/29"),
//                     Text("--------"),
//                     Text("J.P: 1")
//                   ],
//                 )),
//               ),
//               Container(
//                 // color: Colors.blue,
//                 width: width * 0.55,
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       for (var i = 0; i < 5; i++)
//                         Container(
//                           decoration: BoxDecoration(
//                               border: Border(
//                                   bottom: BorderSide(
//                                       color: Colors.white, width: 2))),
//                           height: 32,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                 // color: Colors.green,
//                                 width: 110,
//                                 child: Text('Matière Grasse%'),
//                               ),
//                               Text('11.11'),
//                               IconButton(
//                                 color: Colors.white,
//                                 icon: Icon(Icons.edit),
//                                 onPressed: (() {}),
//                               ),
//                             ],
//                           ),
//                         ),
//                     ]),
//               ),
//               Container(
//                   decoration: BoxDecoration(
//                       border: Border(
//                           left: BorderSide(color: Colors.white, width: 8))),
//                   height: double.infinity,
//                   width: width * 0.22,
//                   padding: EdgeInsets.symmetric(horizontal: 5),
//                   // color: Colors.red,
//                   child: Center(
//                       child: IconButton(
//                     color: Colors.white,
//                     icon: Icon(Icons.delete),
//                     onPressed: (() {}),
//                   ))),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
// }


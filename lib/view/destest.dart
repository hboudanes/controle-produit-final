import 'package:flutter/material.dart';

// class test1 extends StatelessWidget {
//   const test1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ExpansionPanelList(children: [
//          ExpansionPanel(
//            headerBuilder: (context, isExpanded) => Text('data'),
//            body: Text('data')

//          )
//       ]),
//     );
//   }
// }
class test extends StatefulWidget {
  test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  List<bool> _isExpanded = [false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                print(_isExpanded[index]);
                setState(() {
                  _isExpanded[index] = !isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('item.headerValu'),
                    );
                  },
                  body: ListTile(
                      title: Text('item.expandedValue'),
                      subtitle: const Text(
                          'To delete this panel, tap the trash can icon'),
                      trailing: const Icon(Icons.delete),
                      onTap: () {
                        // setState(() {
                        //   _data.removeWhere((Item currentItem) => item == currentItem);
                        // });
                      }),
                  isExpanded: _isExpanded[0],
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('item.headerValu'),
                    );
                  },
                  body: ListTile(
                      title: Text('item.expandedValue'),
                      subtitle: const Text(
                          'To delete this panel, tap the trash can icon'),
                      trailing: const Icon(Icons.delete),
                      onTap: () {
                        // setState(() {
                        //   _data.removeWhere((Item currentItem) => item == currentItem);
                        // });
                      }),
                  isExpanded: _isExpanded[1],
                )
              ]),
        ),
      ),
    );
  }
}

// List<bool> generteListFalse(int length) {
//   List<bool> list = [false];
//   for (var i = 0; i < length - 1; i++) {
//     list.add(false);
//   }
//   print(list);
//   return list;
// }

class testgetx extends StatelessWidget {
  const testgetx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                // print(_isExpanded[index]);
                // setState(() {
                //   _isExpanded[index] = !isExpanded;
                // });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('item.headerValu'),
                    );
                  },
                  body: ListTile(
                      title: Text('item.expandedValue'),
                      subtitle: const Text(
                          'To delete this panel, tap the trash can icon'),
                      trailing: const Icon(Icons.delete),
                      onTap: () {
                        // setState(() {
                        //   _data.removeWhere((Item currentItem) => item == currentItem);
                        // });
                      }),
                  isExpanded: false,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('item.headerValu'),
                    );
                  },
                  body: ListTile(
                      title: Text('item.expandedValue'),
                      subtitle: const Text(
                          'To delete this panel, tap the trash can icon'),
                      trailing: const Icon(Icons.delete),
                      onTap: () {
                        // setState(() {
                        //   _data.removeWhere((Item currentItem) => item == currentItem);
                        // });
                      }),
                  isExpanded: false,
                )
              ])
        ),
      ),
    );;
  }
}
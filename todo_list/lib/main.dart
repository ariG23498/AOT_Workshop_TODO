import 'package:flutter/material.dart';

TextEditingController Tcontroller = TextEditingController();
TextEditingController Scontroller = TextEditingController();
List todoTitle = [];
List todoSubtitle = [];
int count = 0;
void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Notes",
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  renderCard(List a) {
    setState(() {
      todoTitle.add(a[0]);
      todoSubtitle.add(a[1]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: new Text(
          "To-do-list",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: todoTitle.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  // padding: EdgeInsets.only(right: 12.0),
                  // decoration: new BoxDecoration(
                  //     border: new Border(
                  //         right: new BorderSide(
                  //             width: 1.0, color: Colors.white24))),
                  child: GestureDetector(
                    child: Icon(Icons.check, color: Colors.white),
                    onTap: () {
                      setState(() {
                        todoSubtitle.removeAt(index);
                        todoTitle.removeAt(index);
                        // debugPrint("$index");
                      });
                    },
                  ),
                ),
                title: Text(
                  todoTitle[index],
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Text(todoSubtitle[index],
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext ctxt) {
            List total = [];
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
                title: new Text(
                  "To-do-list",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
                centerTitle: true,
              ),
              body: new Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        autofocus: true,
                        controller: Tcontroller,
                      ),
                      TextField(
                        autofocus: true,
                        controller: Scontroller,
                      ),
                      FlatButton(
                        onPressed: () {
                          total.add(Tcontroller.text);
                          total.add(Scontroller.text);
                          debugPrint(total.toString());
                          renderCard(total);
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.check),
                      )
                    ],
                  ),
                ),
              ),
            );
          }));
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: new Container(
          height: 40.0,
        ),
        notchMargin: 10.0,
        shape: CircularNotchedRectangle(),
        color: Color.fromRGBO(64, 75, 96, .9),
      ),
    );
  }
}

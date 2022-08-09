import 'package:flutter/material.dart';
import 'package:todo_manager/add_todo.dart';

import 'today_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              iconTheme: IconThemeData(
                color: Colors.black,
                size: 32,
              ))),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  // bool value = false;
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Task Manager'),
          actions: [IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTodo()));
          }, icon: Icon(Icons.add_circle))],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Welcome Back!',style: TextStyle(fontSize: 18),),
                    Text('here today\'s Update',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  ],
                ),
                  const CircleAvatar(radius:24,backgroundColor: Colors.black, child: Icon(Icons.search,size: 32,color: Colors.white,)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*.03,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TabBar(
                        indicator: BoxDecoration(
                          color: Colors.black,
                          borderRadius:  BorderRadius.circular(25.0),
                        ) ,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: const [
                          Tab(text:'Today'),
                          Tab(text: 'UpComing'),
                          Tab(text: 'Task Done'),
                        ]),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      TodayScreen(),
                      Center(child: Text('Upcoming'),),
                      Center(child: Text('Task Done'),),
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


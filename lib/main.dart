import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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

  bool value = false;
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Task Manager'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add_circle))],
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
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFF282828),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                    IconButton(onPressed: (){}, icon: Icon(Icons.edit_note,color: Colors.white,))
                                  ],),
                                  Text('Taking notes tonight',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 30,),
                                  Row(children: [
                                    Icon(Icons.calendar_today,color: Colors.white,),
                                    SizedBox(width: 10,),
                                    Text('04 July 2022',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ],),
                                  SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.schedule,color: Colors.white,),
                                            SizedBox(width: 10,),
                                            Text('7:30 PM',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        Transform.scale(
                                          scale: 1.5,
                                          child: Checkbox(value: value, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),side: BorderSide(
                                            color: Colors.white,
                                            width: 2,
                                          ),onChanged: (value){
                                            this.value = value!;
                                          },
                                            activeColor: Colors.white,
                                            focusColor: Colors.white,
                                            checkColor: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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

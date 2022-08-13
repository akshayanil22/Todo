import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_manager/main.dart';
import 'package:todo_manager/Controller/todo_controller.dart';

import '../../Model/todo_model.dart';


class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {

final TodoController todoController = Get.find();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();

  TextEditingController todoTextController = TextEditingController();

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

// Select for Time
  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    if (date == null) return;

    final time = await _selectTime(context);

    if (time == null) return;
    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }
  String getDateTime() {
    // ignore: unnecessary_null_comparison
    if (dateTime == null) {
      return 'select date timer';
    } else {
      return DateFormat('dd-MMMM-yyyy HH: mm a').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My New Task'),
            TextField(
              controller: todoTextController,
              maxLines: 3,
              cursorColor: const Color(0xff000000),
              decoration: const InputDecoration(
                border:   UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Text('Date & Time'),
            const SizedBox(height: 15,),
            GestureDetector(
                onTap: (){
                  _selectDateTime(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(getDateTime(),style: const TextStyle(fontWeight: FontWeight.bold),),
                    const Icon(Icons.schedule,size: 18,),
                  ],
                )),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/12,
              child: ElevatedButton(onPressed: () async{
                final TodoModel task = TodoModel();
                _addTaskToDB(task);
                await todoController.addTask(task);
                // Get.offAll(()=>MyHomePage());
                Get.back();
              }, child: const Text('Save'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              ),
            ),
          ],
        ),
      )
    );
  }

  _addTaskToDB(TodoModel task) {
    task.isDone = 0;
    task.title = todoTextController.text;
    task.date = getDateTime();
  }

}

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Database/db_helper.dart';
import '../Model/todo_model.dart';

class TodoController extends GetxController {
  final RxList todoList = <TodoModel>[].obs;
  final RxList listIsDone = <TodoModel>[].obs;
  final RxList todayTodoList = <TodoModel>[].obs;
  final RxList notTodayTodoList = <TodoModel>[].obs;

  // Future<void> getTask(int? isDone)async{
  //   final List<Map<String, dynamic>> tasks = await DBHelper().queryAll(isDone!);
  //   todoList.assignAll(tasks.map((data) => TodoModel.fromMap(data)).toList());
  // }

  Future<void> getDoneTask(int? isDone) async {
    final List<Map<String, dynamic>> tasks =
        await DBHelper().queryAllDone(isDone!);
    listIsDone.assignAll(tasks.map((data) => TodoModel.fromMap(data)).toList());
    // print(listIsDone.length);
  }

  Future<void> getTaskToday(int? isDone, String date) async {
    todayTodoList.clear();
    final List<Map<String, dynamic>> tasks = await DBHelper().queryAll(isDone!);
    todoList.assignAll(tasks.map((data) => TodoModel.fromMap(data)).toList());
    // print(DateFormat('dd-MMMM-yyyy').parse(date));
    for (var element in todoList) {
      // print(element.date.split(" ")[0]);
      if (element.date.split(" ")[0] == date) {
        todayTodoList.add(element);
      }
    }
    // print(todayTodoList.length);
    // print(todoList.length);
  }

  Future<void> getTaskNotToday(int? isDone, String date) async {
    notTodayTodoList.clear();
    final List<Map<String, dynamic>> tasks = await DBHelper().queryAll(isDone!);
    todoList.assignAll(tasks.map((data) => TodoModel.fromMap(data)).toList());
    // print('notToday');
    for (var element in todoList) {
      // print(element.date.split(" ")[0]);
      // print(element.date.split(" ")[0] != date);
      if (element.date.split(" ")[0] != date &&
          (DateFormat('dd-MMMM-yyyy')
              .parse(element.date.split(" ")[0])
              .isAfter(DateFormat('dd-MMMM-yyyy').parse(date)))) {
        // print("element : $element");
        notTodayTodoList.add(element);
      }
    }
    // print(notTodayTodoList.length);
    // print(todoList.length);
  }

  addTask(TodoModel task) async {
    await DBHelper().insertTask(task);
    todoList.add(task);
    getTaskToday(0, DateFormat('dd-MMMM-yyyy').format(DateTime.now()));
    getTaskNotToday(0, DateFormat('dd-MMMM-yyyy').format(DateTime.now()));
  }

  deleteTask(int? id) async {
    await DBHelper().delete(id!);
  }

  deleteAllTasks() async {
    await DBHelper().deleteAllTasks();
  }

  markAsCompleted(int id) async {
    await DBHelper().update(id);
  }
}

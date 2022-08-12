import 'package:get/get.dart';
import 'package:todo_manager/todo_model.dart';

import 'db_helper.dart';

class TodoController extends GetxController {
  final RxList todoList = <TodoModel>[].obs;
  final RxList listIsDone = <TodoModel>[].obs;

  Future<void> getTask(int? isDone)async{
    final List<Map<String, dynamic>> tasks = await DBHelper().queryAll(isDone!);
    todoList.assignAll(tasks.map((data) => TodoModel.fromMap(data)).toList());
  }

  Future<void> getDoneTask(int? isDone)async{
    final List<Map<String, dynamic>> tasks = await DBHelper().queryAllDone(isDone!);
    listIsDone.assignAll(tasks.map((data) => TodoModel.fromMap(data)).toList());
  }

  addTask(TodoModel task)async{
    await DBHelper().insertTask(task);
    todoList.add(task);
  }

  deleteTask(int? id)async{
    await DBHelper().delete(id!);
  }

  deleteAllTasks()async{
    await DBHelper().deleteAllTasks();
  }

  markAsCompleted(int id)async{
    await DBHelper().update(id);
  }
}

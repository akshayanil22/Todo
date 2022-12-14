import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_manager/Controller/todo_controller.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  final String date;
  final String time;
  final int? id;
  final bool isComplete;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.date,
    required this.time,
    required this.id,
    required this.isComplete,
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF282828),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_note,
                      color: Colors.white,
                    ))
              ],
            ),
            Text(
              widget.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.date,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.time,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                widget.isComplete
                    ? const SizedBox()
                    : Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          value: widget.isComplete,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          side: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          onChanged: (value) {
                            // this.value = widget.isComplete;
                            todoController.markAsCompleted(widget.id!);
                            widget.isComplete
                                ? todoController.getDoneTask(1)
                                : todoController.getTaskToday(
                                    0,
                                    DateFormat('dd-MMMM-yyyy')
                                        .format(DateTime.now()));
                            todoController.getTaskNotToday(
                                0,
                                DateFormat('dd-MMMM-yyyy')
                                    .format(DateTime.now()));
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
      ),
    );
  }
}

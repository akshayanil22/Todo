import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
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
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_note,
                      color: Colors.white,
                    ))
              ],
            ),
            Text(
              'Taking notes tonight',
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '04 July 2022',
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                  children: const [
                    Icon(
                      Icons.schedule,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '7:30 PM',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: value,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    onChanged: (value) {
                      setState((){
                        this.value = value!;
                      });
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
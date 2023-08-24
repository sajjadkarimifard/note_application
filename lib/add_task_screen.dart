import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note/home_screen.dart';
import 'package:note/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController Controller_Tasktitle = TextEditingController();
  final TextEditingController Controller_Subtitle = TextEditingController();
  var Box = Hive.box<Task>('taskBox');
  FocusNode myfocusnode = FocusNode();
  FocusNode myfocusnode1 = FocusNode();
  @override
  void initState() {
    super.initState();
    myfocusnode.addListener(() {
      setState(() {});
    });
    myfocusnode1.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: TextField(
                  controller: Controller_Tasktitle,
                  focusNode: myfocusnode,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'GB',
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    labelText: 'عنوان تسک',
                    labelStyle: TextStyle(
                      color: myfocusnode.hasFocus
                          ? Color(0xff18DAA3)
                          : Colors.grey,
                      fontSize: 20,
                      fontFamily: 'SM',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xff18DAA3),
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: TextField(
                  controller: Controller_Subtitle,
                  maxLines: 3,
                  focusNode: myfocusnode1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'GB',
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    labelText: 'عنوان تسک',
                    labelStyle: TextStyle(
                      color: myfocusnode1.hasFocus
                          ? Color(0xff18DAA3)
                          : Colors.grey,
                      fontSize: 20,
                      fontFamily: 'SM',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xff18DAA3),
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff18DAA3),
                  minimumSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  String TaskTitle = Controller_Tasktitle.text;
                  String TaskSubTitle = Controller_Subtitle.text;
                  AddTask(TaskTitle, TaskSubTitle);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                },
                child: Text(
                  'اضافه کردن تسک',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void AddTask(String TaskTitle, String TaskSubTitle) {
    var task = Task(title: TaskTitle, subtitle: TaskSubTitle);
    Box.add(task);
  }
}

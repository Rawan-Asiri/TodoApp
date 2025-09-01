import 'package:flutter/material.dart';

void main() async {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsManager.mintGreen,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                'Hello Rawan,',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
          actions: [
            Icon(Icons.notifications_none),
            SizedBox(width: 8),
            Icon(Icons.menu),
            SizedBox(width: 20),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCards(),
                SizedBox(height: 30),
                Text(
                  'Tasks of the day',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 30),
                TaskCard(
                  title: "Do the first project",
                  backgroundColor: ColorsManager.periwinkleBlue,
                  time: "9:00 AM",
                ),
                SizedBox(height: 20),
                TaskCard(
                  title: "Read for 30 minutes",
                  backgroundColor: ColorsManager.softYellow,
                  time: "11:00 AM",
                ),
                SizedBox(height: 20),
                TaskCard(
                  title: "Do Hash Plus tasks",
                  backgroundColor: ColorsManager.pinkBlush,
                  time: "2:00 PM",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final String time;

  const TaskCard({
    required this.title,
    required this.backgroundColor,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // التاريخ والوقت (في المنتصف بلون رمادي غامق)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey[700]),
              SizedBox(width: 6),
              Text(
                "Today",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(width: 12),
              Icon(Icons.access_time, size: 16, color: Colors.grey[700]),
              SizedBox(width: 6),
              Text(
                time,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          // المهمة
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.circle_outlined),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Icon(Icons.more_horiz),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomCards extends StatelessWidget {
  const CustomCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SummaryCard(
              title: "Today",
              count: "6",
              icon: Icons.calendar_today,
              backgroundColor: ColorsManager.mintGreen,
            ),
            SummaryCard(
              title: "Next Day",
              count: "5",
              icon: Icons.next_plan,
              backgroundColor: ColorsManager.periwinkleBlue,
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SummaryCard(
              title: "Must Do",
              count: "4",
              icon: Icons.priority_high,
              backgroundColor: ColorsManager.softYellow,
            ),
            SummaryCard(
              title: "All",
              count: "15",
              icon: Icons.all_inbox,
              backgroundColor: ColorsManager.pinkBlush,
            ),
          ],
        ),
      ],
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color backgroundColor;

  const SummaryCard({
    required this.title,
    required this.count,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.42,
      height: 100, // أصغر من قبل
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 16)),
              Text(count, style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}

abstract class ColorsManager {
  static const Color periwinkleBlue = Color(0xFFb4c4fe);
  static const Color softYellow = Color.fromARGB(255, 152, 152, 232);
  static const Color mintGreen = Color.fromARGB(255, 132, 195, 250);
  static const Color pinkBlush = Color.fromARGB(255, 192, 235, 255);
  static const Color iceBlue = Color.fromARGB(255, 255, 255, 255);
  static const Color royalBlue = Color(0xFF3B6BB9);
  static const Color snowWhite = Color(0xFFFAFCFC);
  static const Color stoneGrey = Color.fromARGB(255, 216, 221, 234);
  static const Color transparent = Color.fromARGB(0, 237, 225, 225);
}
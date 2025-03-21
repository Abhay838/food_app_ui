import 'package:flutter/material.dart';

class TestFile extends StatefulWidget {
  const TestFile({super.key});

  @override
  State<TestFile> createState() => _TestFileState();
}

class _TestFileState extends State<TestFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            height: 150,
            width: 330,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Iphone 16"),
                    Text("From \$ 60000"),
                    Text("A 18 chip Superfast Supersmart"),
                  ],
                ),
                Image.asset(
                  "assets/ramen.png",
                  height: 80,
                  width: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

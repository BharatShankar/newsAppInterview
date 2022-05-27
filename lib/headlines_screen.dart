import 'package:flutter/material.dart';

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c9be829b24324127a8f35053d445ed22

class HeadLinesScreen extends StatefulWidget {
  const HeadLinesScreen({Key? key}) : super(key: key);

  @override
  State<HeadLinesScreen> createState() => _HeadLinesScreenState();
}

class _HeadLinesScreenState extends State<HeadLinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              const Center(
                child: Text(
                  "HEADLINES",
                  style: TextStyle(
                    fontFamily: 'Roboto Slab',
                    fontSize: 29.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Container(
                            color: Colors.black.withAlpha(200),
                            width: MediaQuery.of(context).size.width - 20,
                            child: Column(
                              children: const [
                                Text(
                                  "this is headlines of news this is headlines of news  this is headlines of news this is headlines of news this is headlines of news ",
                                  style: TextStyle(
                                    fontFamily: 'Roboto Slab',
                                    fontSize: 19.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

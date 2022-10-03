import 'dart:developer';

import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
   PageController _controller = PageController();
  //late ScrollPosition _scrollPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(_listener);
    //_scrollPosition = _controller.position;
  }

  void _listener(){
    log(_controller.page.toString());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.width / 1.5,
              width: size.width / 1.5,
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: _controller,
                children: [
                  Container(
                    height: size.width / 1.5,
                    width: size.width / 1.5,
                    color: Colors.red,
                  ),
                  Container(
                    height: size.width / 1.5,
                    width: size.width / 1.5,
                    color: Colors.green,
                  ),
                  Container(
                    height: size.width / 1.5,
                    width: size.width / 1.5,
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.1),
            SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.3,
                child: ElevatedButton(
                    onPressed: () {
                      if (_controller.hasClients) {
                        log(_controller.page.toString());
                        log('basıldı');
                      }
                    },
                    child: Text('BUTON')))
          ],
        ),
      ),
    );
  }
}

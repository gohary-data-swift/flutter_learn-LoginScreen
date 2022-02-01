import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterVC extends StatefulWidget {

  @override
  State<CounterVC> createState() => _CounterVCState();
}

class _CounterVCState extends State<CounterVC> {
   int counter = 1;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        centerTitle: false,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: (){
                  setState(() {
                    counter--;
                    print(counter);
                  });
                },
                child: Text(
                  'MINUS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
            Text(
              '${counter}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    counter++;
                    print(counter);
                  });
                },
                child: Text(
                  'PLUS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

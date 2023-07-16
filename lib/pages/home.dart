import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = { };

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String bgImage= data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body:  SafeArea(
              child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
              ),
          ),
                child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag'],
                        };
                      });
                    }, 
                    icon: Icon(
                      Icons.edit_location_outlined,
                      color: Colors.grey[200],
                    ), 
                    label: Text(
                      'edit location',
                      style: TextStyle(
                        color: Colors.grey[200],
                      ),
                      )),

                  Center(
                    child: Text(
                        data['location'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                  ),

                  SizedBox(height: 20.0,),

                  Center(
                    child: Text(
                        data['time'],
                          style: TextStyle(
                            color: Colors.white,
                          fontSize: 66.0,
                         ),
                        ),
                  ),

                          
                ],
              ),
            ),
        ),
      ),
    
    );
  }
}
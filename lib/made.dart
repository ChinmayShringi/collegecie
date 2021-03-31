import 'package:flutter/material.dart';

class Coders extends StatefulWidget {
  @override
  _CodersState createState() => _CodersState();
}

class _CodersState extends State<Coders> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Application Owned By'),
        ),
        body: SingleChildScrollView(
        child: ConstrainedBox(
        constraints: BoxConstraints(
        // minHeight: viewportConstraints.maxHeight,
        ),
        child:Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            height: 180,
            child: Card(
              color:Colors.green,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_rounded,color: Colors.white70,),
                    title: const Text('Karan Bhatt',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Cheif Executive Officer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '"We cannot solve our problems with the same thinking we used when we created them."',
                      style: TextStyle(
                        color: Colors.white,

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Image.asset('assets/card-sample-image-2.jpg'),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            height: 180,
            child: Card(
              color:Colors.redAccent,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_rounded,color: Colors.white70,),
                    title: const Text('Hetarth Sangrajka',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Cheif Financial Officer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '"I believe you have to be willing to be misunderstood if you\'re going to innovate."',
                      style: TextStyle(
                        color: Colors.white,

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Image.asset('assets/card-sample-image-2.jpg'),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            height: 180,
            child: Card(
              color:Colors.deepPurple,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_rounded,color: Colors.white70,),
                    title: const Text('Yash Pancholi',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Cheif Operating Officer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '"The first rule of any technology used in a business is that automation applied to an efficient operation will magnify the efficiency."',
                      style: TextStyle(
                        color: Colors.white,

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Image.asset('assets/card-sample-image-2.jpg'),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            height: 180,
            child: Card(
              color:Colors.brown,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_rounded,color: Colors.white70,),
                    title: const Text('Vishal Javeri',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Cheif Information Officer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '"Prepare, listen, question, and participate. IT plays a critical role in taking the organization to the next level of digital maturity."',
                      style: TextStyle(
                        color: Colors.white,

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Image.asset('assets/card-sample-image-2.jpg'),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            height: 180,
            child: Card(
              color:Colors.blueAccent,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_rounded,color: Colors.white70,),
                    title: const Text('Himanshu Sutar',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Cheif Marketing Officer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '"A man is great by deeds, not by birth."',
                      style: TextStyle(
                        color: Colors.white,

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Image.asset('assets/card-sample-image-2.jpg'),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            height: 180,
            child: Card(
              color:Colors.black54,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_rounded,color: Colors.white70,),
                    title: const Text('Chinmay Shringi',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Cheif Technological Officer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '"When something is important enough, you do it even if the odds are not in your favor."',
                      style: TextStyle(
                        color: Colors.white,

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Image.asset('assets/card-sample-image-2.jpg'),
                ],
              ),
            ),
          ),
        ]),
    )
        )
      ),
    );
  }
}

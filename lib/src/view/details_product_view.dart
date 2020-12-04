import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/constants/constants.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.id}) : super(key: key);

  final String id;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextEditingController _controller;
  int photoIndex = 0;

  List<String> photos = [
    'assets/oldwave-icon.png',
    'assets/oldwave-logo-horizontal.png',
    'assets/oldwave-logo-vertical.png',
  ];

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  void initState() {
    _controller = TextEditingController(text: this.widget.id);
    print(_controller.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Image.asset(
            'assets/oldwave-logo-horizontal.png',
            fit: BoxFit.cover,
            scale: 2,
          ),

          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                color: purpleMainColor,
                onPressed: () {},
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Image.asset('assets/user_icon.png'),
              color: purpleMainColor,
              onPressed: () {
                print('Click search');
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: blueComplementaryColor,
              onPressed: () {
                print('Click start');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: TextField(
                      cursorColor: Colors.grey,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: purpleMainColor,
                            size: 25,
                          ),
                          border: InputBorder.none,
                          hintText: "Search Products",
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 14.0)),
                    ),
                  ),
                  decoration: BoxDecoration(color: purpleMainColor),
                ),
                Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      Center(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  image: DecorationImage(
                                      image: AssetImage(photos[photoIndex]),
                                      fit: BoxFit.cover)),
                              height: 400.0,
                              width: 300.0,
                            ),
                            Positioned(
                              top: 375.0,
                              left: 25.0,
                              right: 25.0,
                              child: SelectedPhoto(
                                  numberOfDots: photos.length,
                                  photoIndex: photoIndex),
                            ),
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              child: Text('Next'),
                              onPressed: _nextImage,
                              elevation: 5.0,
                              color: purpleComplementaryColor,
                            ),
                            SizedBox(width: 10.0),
                            RaisedButton(
                              child: Text('Previous'),
                              onPressed: _previousImage,
                              elevation: 5.0,
                              color: purpleComplementaryColor,
                            ),
                          ]),
                      SizedBox(height: 15.0),
                      Text(
                        'Nombre del producto',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Monserrat',
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15.0),
                    ])),
              ],

              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ));
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
        child: new Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(4.0)),
      ),
    ));
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}

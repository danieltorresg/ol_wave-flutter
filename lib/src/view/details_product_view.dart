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
                              child: Text('Previous'),
                              onPressed: _previousImage,
                              elevation: 5.0,
                              color: purpleComplementaryColor,
                            ),
                            SizedBox(width: 10.0),
                            RaisedButton(
                              child: Text('Next'),
                              onPressed: _nextImage,
                              elevation: 5.0,
                              color: purpleComplementaryColor,
                            ),
                          ]),
                      SizedBox(height: 15.0),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Nombre del producto',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27),
                              ),
                            ]),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Marca',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 30.0),
                            Icon(Icons.location_on,
                                color: blueComplementaryColor),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Ciudad',
                              style: TextStyle(
                                color: blueComplementaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                      SizedBox(height: 15.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Vendedor',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 30.0),
                            Icon(Icons.attach_money,
                                color: blueComplementaryColor),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '35.000',
                              style: TextStyle(
                                color: blueComplementaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              'COP',
                              style: TextStyle(
                                color: blueComplementaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                      SizedBox(height: 15.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.star, color: blueComplementaryColor),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Rating',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                      SizedBox(height: 15.0),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Este televisor LED utiliza un nuevo tipo de luz en la pantalla, que lo hace súper delgado. Niveles de negro más profundos. Ideal para instalarlo en la pared. Perfecto para habitaciones claras y para tener la mejor experiencia de cine en casa. Ayuda al ahorro de energía. Pantalla Crystal Display Sumérgete en tus contenidos con una gama de colores mucho más amplia. La pantalla Crystal Display garantiza una expresión de colores optimizada para que no te pierdas ningún detalle. Su increíble calidad de imagen es posible gracias al procesador Crystal UHD 4K, el cual ofrece amplia gama de colores vivos y vibrantes, optimiza el contraste en escenas oscuras y permite equilibrar el brillo de los contenidos gracias a su Alto Rango Dinámico (HDR) Diseño elegante para que veas las imágenes sin límites. Fabricado con un estilo minimalista impecable de marcos ultradelgados que establece estándares nuevos en diseño. Podrás disfrutar de la experiencia cinematográfica más inmersiva que hayas vivido. La tecnología de Alto Rango Dinámico (HDR) optimiza la regulación de brillo del televisor para que puedas disfrutar de un inmenso espectro de colores y detalles visuales, incluso en las escenas más oscuras. Gracias a que tiene AirPlay 2 integrado, puedes transmitir o compartir contenido desde dispositivos Apple en la pantalla grande. Puedes reproducir videos, música, fotografías y más sin esfuerzo desde tu iPhone, iPad y Mac en tu televisor ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontSize: 18),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.shopping_cart,
                                color: purpleComplementaryColor),
                            SizedBox(
                              width: 5.0,
                            ),
                            RaisedButton(
                              child: Text(
                                'Agregar al carrito',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              elevation: 5,
                              color: purpleComplementaryColor,
                              onPressed: () {
                                print('Click start');
                              },
                            ),
                          ]),
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

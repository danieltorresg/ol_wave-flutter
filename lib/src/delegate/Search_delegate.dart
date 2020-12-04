import 'package:flutter/material.dart';
import 'package:old_wave_flutter/src/model/Model_search_product.dart';


import 'package:old_wave_flutter/src/providedrs/Provider_Product.dart';


class DataSearch extends SearchDelegate{

  DataSearch();

  final productosProvider = new ProductosProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
      //Son las acciones de nuestro AppBar
      return[
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed: (){
            query = '';
          })
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Icono a la izquierda del AppBar
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, 
          progress: transitionAnimation
        ), 
        onPressed: (){
          close(context,null);
        }
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // Es la instrucccion que crea los resultados que vamos a mostrar
      return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparece cuando la persona escribe
    if(query.isEmpty){
      return Container();
    }

    return FutureBuilder(
      future: productosProvider.getProduct_net(query),
      builder: (BuildContext context, AsyncSnapshot <List<Item>>snapshot) {

        if (snapshot.hasData) {
          //Aqui debe ir toda la implementacion del consumo de los datos a mostrar
         
        } else {
          return Center(
            child: CircularProgressIndicator()
          );
        }
      },
    );
  }

}














































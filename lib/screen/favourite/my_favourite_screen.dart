import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../counter_example/favourite_provider.dart';

class MyFavouriteScreen extends StatelessWidget {
  const MyFavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("My Favourite Screen"),centerTitle: true,),
      body:   Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView.builder(
              itemCount: favouriteProvider.selectedItem.length,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(builder: (context, value, child) {
                  return ListTile(
                    onTap: (){

                      if(value.selectedItem.contains(index)){
                        value.removeItems(index);

                      }
                      else{
                        value.addItems(index);

                      }

                      print(index.toString());
                      print(value.selectedItem.toString());

                    },
                    title: Text("Item $index"),
                    trailing:value.selectedItem.contains(index)?const Icon(Icons.favorite) :const Icon(Icons.favorite_border_outlined),

                  );
                },);
              },),
          ))

        ],
      ),
    );
  }
}

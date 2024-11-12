import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/counter_example/favourite_provider.dart';
import 'package:provider_statemanagement/screen/favourite/my_favourite_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("build");
    //final favouriteProvider = Provider.of<FavouriteProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Favorite Screen",style: TextStyle(color: Colors.white),),centerTitle: true,
      actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyFavouriteScreen(),));
        }, icon: Icon(Icons.favorite))
      ],),

      body: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView.builder(
              itemCount: 20,
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

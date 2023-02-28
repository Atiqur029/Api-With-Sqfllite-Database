



import 'package:apiwithcroudsqflite/database/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controlar/productstatemanagment.dart';


class HomePage extends StatelessWidget {
  final controlar=Get.put(Showproduct());
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Product"),),
      body: Obx(() {
        if(controlar.isload.value==true){
          return const Center(child: CircularProgressIndicator(),);
        }
        else{
          return FutureBuilder(
          future: DBHelper.instence.fetchdata(),
          
          builder: ((context, snapshot) {
            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),);

            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              
              itemBuilder: ((context, index) {
                final productlist=snapshot.data![index];
                 return Container(
                  height: 100,
                  color: Colors.amber,
                  
                  child: ListTile(title: Text(productlist.title!,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),subtitle: Text(' Id:${productlist.id.toString()}',style: const TextStyle(color: Colors.redAccent,fontSize: 15,fontWeight: FontWeight.bold),)));

                
              }));
            
          }));
      
        }
        
      },) 
         
    );
  }
}
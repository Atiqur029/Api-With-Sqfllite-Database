
import 'package:apiwithcroudsqflite/controlar/getdata.dart';
import 'package:apiwithcroudsqflite/database/data.dart';
import 'package:apiwithcroudsqflite/model/product.dart';
import 'package:get/get.dart';

class Showproduct extends GetxController{

  Getdata getdata=Getdata();

  RxList<Productmodel> productlist=<Productmodel>[].obs;


  var isload=false.obs;
  //final DBHelper dbHelper=DBHelper();

  @override
  void onInit() {
    fetchalldata();
    
    super.onInit();
  }
  
  Future fetchalldata() async{

    isload.value=true;

    var productapi=await  getdata.getAllproduct();

    productlist.clear();
    isload(false);
    productlist.value=productapi!;

    for (var element in productlist) {

      DBHelper.instence.insertdata(model: element);
      
    }
    

  }


}
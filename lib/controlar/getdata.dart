

import 'package:apiwithcroudsqflite/model/product.dart';
import 'package:http/http.dart' as http;
class Getdata{

  Future<List<Productmodel>?> getAllproduct() async{

    var respons=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if(respons.statusCode==200){
      return productmodelFromJson(respons.body);
    }
    return null;

  }

  
}
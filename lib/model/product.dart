// To parse this JSON data, do
//
//     final productmodel = productmodelFromJson(jsonString);

import 'dart:convert';

List<Productmodel> productmodelFromJson(String str) => List<Productmodel>.from(json.decode(str).map((x) => Productmodel.fromJson(x)));

String productmodelToJson(List<Productmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Productmodel {
    Productmodel({
         this.userId,
         this.id,
         this.title,
         //this.completed,
    });

    int ?userId;
    int ?id;
    String ?title;
    bool ?completed;

    factory Productmodel.fromJson(Map<String, dynamic> json) => Productmodel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        //completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        //"completed": completed,
    };
}

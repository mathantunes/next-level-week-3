import 'dart:core';

class Orphanage {
  String name;
  double latitude;
  double longitude;
  String about;
  String instructions;
  String open;
  bool openOnWeekend;
  String id;
  List<String> images; // ! Download url to images located on Firebase Storage

  Orphanage(
      {this.name,
      this.latitude,
      this.longitude,
      this.about,
      this.instructions,
      this.open,
      this.openOnWeekend,
      this.id,
      this.images});

  factory Orphanage.fromJSON(Map<String, dynamic> json, String id) {
    return Orphanage(
        name: json["name"] as String,
        latitude: json["latitude"] as double,
        longitude: json["longitude"] as double,
        about: json["about"] as String,
        instructions: json["instructions"] as String,
        open: json["open"] as String,
        openOnWeekend: json["openOnWeekend"] as bool,
        id: id,
        images: json["images"] as List<String>);
  }

  Map<String, dynamic> toJSON() {
    return {
      "name": this.name,
      "latitude": this.latitude,
      "longitude": this.longitude,
      "about": this.about,
      "instructions": this.instructions,
      "open": this.open,
      "openOnWeekend": this.openOnWeekend,
      "id": this.id,
      "images": this.images
    };
  }
}

import 'dart:core';

class Orphanage {
  String name;
  double latitude;
  double longitude;
  String about;
  String instructions;
  String open;
  bool openOnWeekend;

  Map<String, dynamic> toJSON() {
    return {
      "name": this.name,
      "latitude": this.latitude,
      "longitude": this.longitude,
      "about": this.about,
      "instructions": this.instructions,
      "open": this.open,
      "openOnWeekend": this.openOnWeekend,
    };
  }
}

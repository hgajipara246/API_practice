// To parse this JSON data, do
//
//     final breweryModel = breweryModelFromJson(jsonString);

import 'dart:convert';

List<BreweryModel> breweryModelFromJson(String str) => List<BreweryModel>.from(json.decode(str).map((x) => BreweryModel.fromJson(x)));

String breweryModelToJson(List<BreweryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BreweryModel {
  String? id;
  String? name;
  String? breweryType;
  String? address1;
  String? address2;
  dynamic address3;
  String? city;
  String? stateProvince;
  String? postalCode;
  String? country;
  String? longitude;
  String? latitude;
  String? phone;
  String? websiteUrl;
  String? state;
  String? street;

  BreweryModel({
    this.id,
    this.name,
    this.breweryType,
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.stateProvince,
    this.postalCode,
    this.country,
    this.longitude,
    this.latitude,
    this.phone,
    this.websiteUrl,
    this.state,
    this.street,
  });

  factory BreweryModel.fromJson(Map<String, dynamic> json) => BreweryModel(
        id: json["id"],
        name: json["name"],
        breweryType: json["brewery_type"],
        address1: json["address_1"],
        address2: json["address_2"],
        address3: json["address_3"],
        city: json["city"],
        stateProvince: json["state_province"],
        postalCode: json["postal_code"],
        country: json["country"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        phone: json["phone"],
        websiteUrl: json["website_url"],
        state: json["state"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brewery_type": breweryType,
        "address_1": address1,
        "address_2": address2,
        "address_3": address3,
        "city": city,
        "state_province": stateProvince,
        "postal_code": postalCode,
        "country": country,
        "longitude": longitude,
        "latitude": latitude,
        "phone": phone,
        "website_url": websiteUrl,
        "state": state,
        "street": street,
      };
}

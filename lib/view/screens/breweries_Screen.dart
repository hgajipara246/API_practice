import 'dart:convert';

import 'package:api_practice/model/brewery_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BreweriesScreen extends StatefulWidget {
  const BreweriesScreen({super.key});

  @override
  State<BreweriesScreen> createState() => _BreweriesScreenState();
}

class _BreweriesScreenState extends State<BreweriesScreen> {
  final Dio dio = Dio();
  List<BreweryModel> breweryModel = [];

  getUserData() async {
    try {
      final response = await dio.get(
        "https://brianiswu-open-brewery-db-v1.p.rapidapi.com/breweries",
        options: Options(
          headers: {
            "x-rapidapi-host": "brianiswu-open-brewery-db-v1.p.rapidapi.com",
            "x-rapidapi-key": "49880797e1msh058a8f64ac18e49p1245cfjsn08633bdfebed",
          },
        ),
      );

      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        breweryModel = breweryModelFromJson(jsonEncode(response.data));
        setState(() {
          breweryModel = breweryModelFromJson(jsonEncode(response.data));
        });
        debugPrint("User Model -----> ${breweryModel[2].city}");
      } else {
        debugPrint("Request failed with status code: ${response.statusCode}");
      }
    } catch (error) {
      debugPrint("Error: $error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Screen",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () => getUserData(),
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: breweryModel.length,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ID                          : ${breweryModel[index].id}",
              ),
              Text(
                "Name                   : ${breweryModel[index].name}",
              ),
              Text(
                "breweryType       : ${breweryModel[index].breweryType}",
              ),
              Text(
                "phone                   : ${breweryModel[index].phone}",
              ),
              Text(
                "address 1             : ${breweryModel[index].address1}",
              ),
              Text(
                "address 2             : ${breweryModel[index].address2}",
              ),
              Text(
                "address 3             : ${breweryModel[index].address3}",
              ),
              Text(
                "city                        : ${breweryModel[index].city}",
              ),
              Text(
                "stateProvince      : ${breweryModel[index].stateProvince}",
              ),
              Text(
                "postalCode          : ${breweryModel[index].postalCode}",
              ),
              Text(
                "country                 : ${breweryModel[index].country}",
              ),
              Text(
                "longitude              : ${breweryModel[index].longitude}",
              ),
              Text(
                "latitude                 : ${breweryModel[index].latitude}",
              ),
              Text(
                "phone                   : ${breweryModel[index].phone}",
              ),
              Text(
                "websiteUrl           : ${breweryModel[index].websiteUrl}",
              ),
              Text(
                "state                     : ${breweryModel[index].state}",
              ),
              Text(
                "street                    : ${breweryModel[index].street}",
              ),
            ],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => getUserData(),
        child: IconButton(
          icon: const Icon(Icons.download),
          onPressed: () {},
        ),
      ),
    );
  }
}

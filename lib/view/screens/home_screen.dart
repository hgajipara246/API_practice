import 'dart:convert';

import 'package:api_practice/model/location_model.dart';
import 'package:api_practice/res/constant/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Dio dio = Dio();

  List<UserModel> userModel = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () => getUserData(),
            icon: Icon(Icons.download),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: userModel.length,
          itemBuilder: (context, index) => Column(
            children: [
              Text(
                "${userModel[index].id}",
              ),
              Text(
                "${userModel[index].name}",
              ),
              Text(
                "${userModel[index].email}",
              ),
              Text(
                "${userModel[index].phone}",
              ),
              Text(
                "${userModel[index].website}",
              ),
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
        ),
      ),
    );
  }

  getUserData() async {
    Response response;

    response = await dio.get("${Constant.baseUrl}/users");
    debugPrint(response.data.toString());
    // response = await dio.get(
    //   "${Constant.baseUrl}/users",
    // );

    debugPrint(response.data.toString());

    userModel = userModelFromJson(jsonEncode(response.data));
    setState(() {});
    debugPrint("User Model -----> ${userModel[2].name}");
  }
}

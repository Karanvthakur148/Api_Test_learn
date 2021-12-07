import 'package:flutter/material.dart';
import 'package:newworkapi/apiservice.dart';

import 'apicalling_three.dart';

class SecondApiPage extends StatefulWidget {
  const SecondApiPage({required this.country});
final String country;

  @override
  _SecondApiPageState createState() => _SecondApiPageState();
}

class _SecondApiPageState extends State<SecondApiPage> {

  final APICalling _apiCalling = APICalling();
  List? defaultDatabyStatus;
  void callDefault(status) async{
    var response = await _apiCalling.getCountryStatusData(widget.country,status);
    setState(() {
      defaultDatabyStatus = response;

    });
  }
  @override
  void initState() {
    callDefault("confirmed");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(),
      body: defaultDatabyStatus != null? ListView.builder(itemCount: defaultDatabyStatus!.length,
        itemBuilder: (context, index) {
          return  Card(
            child: ListTile(
               leading: GestureDetector(onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return ApiThreePage();
                 },));
               },
                   child: Text('NextScreen')),
              title: Text(defaultDatabyStatus![index]["Country"]),
              subtitle: Text(defaultDatabyStatus![index]["CountryCode"]),
              trailing: Text(defaultDatabyStatus![index]["Status"]),
            ),
          );
        },):const Center(child: SizedBox(height: 50,width: 50,
        child: CircularProgressIndicator(),)),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.menu),
        onPressed: () {
        showModalBottomSheet(context: context, builder: (context){
          return Column(mainAxisSize: MainAxisSize.min,
            children:  [
              ListTile(
                title: const Text('Confirmed'),
                onTap: () {
                  Navigator.pop(context);
                  callDefault("confirmed");
                },
              ),
              ListTile(
                title: const Text('Deaths'),
                onTap: () {
                  Navigator.pop(context);
                  callDefault("deaths");

                },
              ),
              ListTile(
                title: const Text('Recovered'),
                onTap: () {
                  Navigator.pop(context);
                  callDefault("recovered");
                },
              )

            ],
          );
        });
        },),

    );


  }
}

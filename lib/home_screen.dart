import 'package:flutter/material.dart';
import 'package:submission/tourism_place_grid.dart';
import 'package:submission/model/tourism_place.dart';
import 'package:submission/text_style.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<TourismPlace> searchResult = [];

  @override
  void initState() {
    searchResult = tourismPlaceList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181A20),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.white)
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle, color: Colors.white)
          )
        ],
        elevation: 0,
        backgroundColor: Color(0xFF181A20),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Discover",
                style: headerTextStyle
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Explore the best place in Bandung!",
                style: subHeaderTextStyle
              ),
            ),
            SizedBox(height: 32),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4.0, left: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Color(0xFF444452),
              ),
              child: TextField(
                autofocus: false,
                style: normalTextStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search your destination',
                  hintStyle: normalTextStyle,
                  suffixIcon: CircleAvatar(
                    backgroundColor: Color(0xFFFF5A6E),
                    child: Icon(Icons.search, color: Colors.white)
                  )
                ),
                onChanged: (query) {
                  setState(() {
                    if (query.length < 1) {
                      searchResult = tourismPlaceList;
                    } else {
                      searchResult = tourismPlaceList.where((item) => item.name.toLowerCase().contains(query.toLowerCase())).toList();
                    }
                  });
                }
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Destination List',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            TourismPlaceGrid(searchResult: searchResult),
            SizedBox(height: 16,),
          ]
        )
      )
    );
  }
}
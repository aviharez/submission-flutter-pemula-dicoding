import 'package:flutter/material.dart';
import 'package:submission/model/tourism_place.dart';
import 'package:submission/text_style.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181A20),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 450,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 4.0,
                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: place.name,
                          child: Image.asset(
                            place.imageAsset,
                            height: 450,
                            fit: BoxFit.fitHeight
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter,
                                colors: <Color>[
                                  Colors.black12.withOpacity(0.0),
                                  Colors.black
                                ]
                              )
                            ),
                          )
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  place.name,
                                  style: headerTextStyle
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text(
                                      '${place.rating} of 5',
                                      style: normalTextStyle,
                                    )
                                  ]
                                )
                              ],
                            ) 
                            
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: Color(0x80444452),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFF444452),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.arrow_back, color: Color(0xFFFF5A6E))
                                    )
                                  )
                                )
                              ),
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: Color(0x80444452),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFF444452),
                                    child: FavoriteButton()
                                  )
                                )
                              ),
                            ]
                          )
                        )
                      ]
                    ),
                  )
                ) 
              )
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Overview',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Color(0xFFFF5A6E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade800,
                                blurRadius: 12,
                              ),
                            ]
                          ),
                          child: Icon(Icons.access_time_filled, color: Color(0xFFFF5A6E))
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Open Days',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w100,
                              )
                            ),
                            Text(
                              place.openDays,
                              style: subHeaderTextStyle
                            )
                          ]
                        )
                      ]
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade800,
                                blurRadius: 12,
                              ),
                            ]
                          ),
                          child: Icon(Icons.monetization_on, color: Color(0xFFFF5A6E))
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Price',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w100,
                              )
                            ),
                            Text(
                              place.ticketPrice,
                              style: subHeaderTextStyle
                            )
                          ]
                        )
                      ]
                    )
                  )
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.description,
                style: normalTextStyle
              )
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Gallery',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Color(0xFFFF5A6E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            Container(
              height: 170,
              padding: const EdgeInsets.only(left: 12.0),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url)
                    )
                  );
                }).toList(),
              ),
            ),
          ]
        )
      )
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Color(0xFFFF5A6E),
      )
    );
  }
}
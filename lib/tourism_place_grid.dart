import 'package:flutter/material.dart';
import 'package:submission/detail_screen.dart';
import 'package:submission/model/tourism_place.dart';
import 'package:submission/text_style.dart';

class TourismPlaceGrid extends StatelessWidget {
  final List<TourismPlace> searchResult;
  const TourismPlaceGrid({Key? key, required this.searchResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView.count(
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: (3 / 4),
        children: searchResult.map((place) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },
            child: Container(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFF444452),
                elevation: 4.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: 
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Hero(
                          tag: place.name,
                          child: Image.asset(place.imageAsset, fit: BoxFit.cover),
                        )
                      )
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        place.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF5A6E)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        place.location,
                        style: normalTextStyle,
                      ),
                    ),
                  ]
                )
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:xmlpars/movies.dart';
import 'package:xmlpars/widget/recommend.dart';

class DetailScreen extends StatelessWidget {
  Movies? movie;
  List<Movies>? allMovies;
  DetailScreen({required this.movie, required this.allMovies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 46, 43, 43),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CarouselSlider(
                  items:
                      movie!.images!.map((img) => Image.network(img)).toList(),
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 13 / 4,
                    viewportFraction: 1.7,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  )),
              Positioned(
                  top: 0,
                  left: 10,
                  height: 150,
                  width: 50,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          movie!.title!,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton.icon(
                              color: Colors.red[700],
                              icon: Icon(Icons.play_arrow),
                              label: Text("Play"),
                              onPressed: () {},
                            ),
                            SizedBox(width: 20),
                            CircleAvatar(
                              backgroundColor: Colors.red[200],
                              child: Icon(
                                Icons.add,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movie!.plot!,
                  style: TextStyle(color: Colors.white60, fontSize: 16),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Released: " + movie!.released!,
                  style: TextStyle(color: Colors.blue),
                ),
                Text(
                  "Gener: " + movie!.genre!,
                  style: TextStyle(color: Colors.red[700]),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Recommendation",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: RecommendList(
                movies: allMovies!.where(
              (element) {
                return element.genre!.contains(movie!.genre!);
              },
            ).toList()),
          )
        ],
      ),
    );
  }
}

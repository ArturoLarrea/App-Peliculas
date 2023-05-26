import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../model/movies.dart';

class CardSwiper extends StatelessWidget {
  late List<Movies> movies;
  CardSwiper({required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      width: double.infinity,
      child: Swiper(
        itemCount: movies.length,
        itemHeight: size.height * 0.45,
        itemWidth: size.height * 0.3,
        layout: SwiperLayout.STACK,
        itemBuilder: (context, index) {
          var movie = movies[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterPath)),
            ),
          );
        },
      ),
    );
  }
}

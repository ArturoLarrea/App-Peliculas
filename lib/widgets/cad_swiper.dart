import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      width: double.infinity,
      child: Swiper(
        itemCount: 10,
        itemHeight: size.height * 0.45,
        itemWidth: size.height * 0.3,
        layout: SwiperLayout.STACK,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage('http://via.placeholder.com/300x400')),
            ),
          );
        },
      ),
    );
  }
}

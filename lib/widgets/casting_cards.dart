import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 180,
      //color: Colors.red,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) => _CastCard(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 100,
      width: 110,
      //color: Colors.green,
      child: Column(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              image: AssetImage("assets/no-image.jpg"),
              placeholder: NetworkImage('https://via.placeholder.com/100x300'),
              width: 98,
              fit: BoxFit.cover,
            )),
        const SizedBox(
          width: 5,
        ),
        const Text(
          "actor.name asdeassdasfe",
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        )
      ]),
    );
  }
}

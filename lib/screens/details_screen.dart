import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndTitle(),
            _OverView(),
            _OverView(),
            _OverView(),
            _OverView(),
            _OverView(),
            CastingCards()
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        centerTitle: true,
        title: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          color: Colors.black26,
          padding: const EdgeInsets.only(bottom: 5),
          child: const Text('movie.tile'),
        ),
        background: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/500x300'),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/200x300'),
                height: 150,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'movie.title',
                  style: textTheme.headlineSmall,
                ),
                Text(
                  'movie.originalTitle',
                  style: textTheme.titleMedium,
                ),
                Row(children: [
                  const Icon(
                    Icons.star_border,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'movie.voteAverage',
                    style: textTheme.bodySmall,
                  )
                ])
              ],
            )
          ],
        ));
  }
}

class _OverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        "Officia anim excepteur ullamco labore irure nulla enim. Voluptate anim do do sint do nostrud exercitation occaecat nisi fugiat minim consequat. Aliqua qui sint consectetur ex eiusmod non eiusmod tempor labore cillum magna reprehenderit fugiat.",
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

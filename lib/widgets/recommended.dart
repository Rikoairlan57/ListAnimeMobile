import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/anime_provider.dart';
import '../providers/favorite_provider.dart';
import '../widgets/anime_card.dart';

class Recommended extends StatefulWidget {
  const Recommended({super.key});

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    final favoritedata = Provider.of<FavoriteProvider>(context).favorites;
    final animedata = Provider.of<AnimeProvider>(context).animes;
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) => AnimeCard(
                  id: animedata[index].malId,
                  title: animedata[index].title,
                  imageUrl: animedata[index].imageUrl,
                  favorite:
                      favoritedata.contains(animedata[index].malId.toString())),
              itemCount: animedata.length),
        ),
      ],
    );
  }
}

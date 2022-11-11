import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/main.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

import '../../../application/Search/search_bloc/search_bloc.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextWidget(title: "Movies & Tv"),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                shrinkWrap: true,
                childAspectRatio: 1 / 1.4,
                crossAxisCount: 3,
                children: List.generate(20, (index) {
                  final movie = state.searchResultList[index];
                  return MainCard(
                    imageUrl: '$imageAppendUrl${movie.posterPath}',
                  );
                }),
              );
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({super.key, required this.imageUrl});
  /* final imageurl =
      "https://www.themoviedb.org/t/p/w220_and_h330_face/lJA2RCMfsWoskqlQhXPSLFQGXEJ.jpg"; */

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
    );
  }
}

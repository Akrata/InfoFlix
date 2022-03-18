import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/rendering.dart';
import 'package:movies_app/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
        width: double.infinity,
        height: size.height * 0.56,
        child: Swiper(
          itemCount: movies.length,
          axisDirection: AxisDirection.left,
          layout: SwiperLayout.STACK,
          itemHeight: size.height * 0.5,
          itemWidth: size.width * 0.5,
          itemBuilder: (BuildContext context, int index) {
            final Movie movie = movies[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                'details',
                arguments: movie,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                // child: Text(
                //   index.toString(),
                //   style: TextStyle(fontSize: 20),
                // ),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ));
  }
}

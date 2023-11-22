import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/utils/constants.dart';

import '../../../utils/app_colors.dart';

class MovieCard extends StatelessWidget {
  final String imgUrl;
  final double rate;
  final int id;
  const MovieCard({
    required this.imgUrl,
    required this.rate,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: CachedNetworkImage(
          imageUrl: '${AppConstants.baseImageUrl}$imgUrl',
          errorWidget: (context, url, error) {
            return const Icon(Icons.image_not_supported_outlined , color: Colors.red,);
          },
          imageBuilder: (context, imageProvider) {
            return Stack(
              children: [
                AspectRatio(
                  aspectRatio: 2.2 / 3,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 10,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.green,
                    ),
                    child: Text(
                       rate.toString(),
                     style: const TextStyle(fontSize: 10 ,color: Colors.white, ),

                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/movie_model.dart';
import '../../widgets/network_image_widget.dart';
import 'info_row.dart';

class MovieTile extends StatelessWidget {
  final MovieModel movie;

  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        shadowColor: Colors.grey.shade400,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                child: NetworkImageWidget(
                  imageUrl: movie.posterPath,
                  width: 125,
                  height: 187.5,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    InfoRow(
                      infoTitle: 'Título original:',
                      info: movie.originalTitle ?? '',
                    ),
                    if (movie.releaseDate != null) ...[
                      const SizedBox(height: 8),
                      InfoRow(
                        infoTitle: 'Data de lançamento:',
                        info:
                            DateFormat("dd/MM/yyyy").format(movie.releaseDate!),
                      ),
                    ],
                    if (movie.voteAverage != null &&
                        movie.voteCount != null) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          InfoRow(
                            infoTitle: 'Total de votos:',
                            info: movie.voteCount.toString(),
                          ),
                          InfoRow(
                            infoTitle: 'Nota:',
                            info: NumberFormat("##.0#", "pt_BR")
                                .format(movie.voteAverage),
                          ),
                        ],
                      ),
                    ],
                    if (movie.overview?.replaceAll(' ', '').isNotEmpty ??
                        false) ...[
                      const SizedBox(height: 8),
                      Text(
                        movie.overview ?? '',
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

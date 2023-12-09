import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:flutter/material.dart';

class StarsComponent extends StatelessWidget {
  final double rating;
  const StarsComponent({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizerHelper.calculateVertical(context, 80),
      width: SizerHelper.calculateHorizontal(context, 200),
      child: Row(
        children: [
          Icon(
            rating >= 1 ? Icons.star_rate_rounded : Icons.star_border_rounded,
            size: 37,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          rating > 1 && rating < 2
              ? Icon(
                  Icons.star_half_rounded,
                  size: 37,
                  color: Theme.of(context).colorScheme.primaryContainer,
                )
              : Icon(
                  rating >= 2
                      ? Icons.star_rate_rounded
                      : Icons.star_border_rounded,
                  size: 37,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
          rating > 2 && rating < 3
              ? Icon(
                  Icons.star_half_rounded,
                  size: 37,
                  color: Theme.of(context).colorScheme.primaryContainer,
                )
              : Icon(
                  rating >= 3
                      ? Icons.star_rate_rounded
                      : Icons.star_border_rounded,
                  size: 37,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
          rating > 3 && rating < 4
              ? Icon(
                  Icons.star_half_rounded,
                  size: 37,
                  color: Theme.of(context).colorScheme.primaryContainer,
                )
              : Icon(
                  rating >= 4
                      ? Icons.star_rate_rounded
                      : Icons.star_border_rounded,
                  size: 37,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
          rating > 4 && rating < 5
              ? Icon(
                  Icons.star_half_rounded,
                  size: 37,
                  color: Theme.of(context).colorScheme.primaryContainer,
                )
              : Icon(
                  rating >= 5
                      ? Icons.star_rate_rounded
                      : Icons.star_border_rounded,
                  size: 37,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
        ],
      ),
    );
  }
}

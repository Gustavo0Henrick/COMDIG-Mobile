import 'package:comdig/src/modules/dashboard/features/home/carousel/presenter/components/home_card_component.dart';
import 'package:flutter/material.dart';

class CardsCarouselComponent extends StatefulWidget {
  final PageController pageController;
  const CardsCarouselComponent({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<CardsCarouselComponent> createState() => _CardsCarouselComponentState();
}

class _CardsCarouselComponentState extends State<CardsCarouselComponent> {
  int _indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: widget.pageController,
        onPageChanged: (page) => setState(() => _indexPage = page),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: HomeCardComponent(
                isCurrentCard: _indexPage == index,
              ),
            ),
          );
        });
  }
}

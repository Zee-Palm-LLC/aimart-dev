import '../../../data/constants/constants.dart';

class OnBoarding {
  String title;
  String image;
  String subTitle;
  OnBoarding({
    required this.title,
    required this.image,
    required this.subTitle,
  });
}

List<OnBoarding> onBoardinglist = [
  OnBoarding(
    title: 'Find The Latest Products That You Like',
    image: CustomAssets.kFirstOnboarding,
    subTitle:
        'Find your dream fashion product as easy as scrolling the screen.',
  ),
  OnBoarding(
    title: 'Get Quality and Guaranteed Items',
    image: CustomAssets.kMidOnboarding,
    subTitle: 'We present high quality products with guaranteed guarantees.',
  ),
  OnBoarding(
    title: 'Enjoy Free Shipping and Express Shipping',
    image: CustomAssets.klastonboarding,
    subTitle: 'You can enjoy fast delivery without having to pay extra',
  )
];

import '../../../data/constants/constants.dart';

class onBoardingModel {
  String title;
  String image;
  String subTitle;
  onBoardingModel({
    required this.title,
    required this.image,
    required this.subTitle,
  });
}

List<onBoardingModel> onBoardinglist = [
  onBoardingModel(
    title: 'Find The Latest Products That You Like',
    image: CustomAssets.kFirstOnboarding,
    subTitle:
        'Find your dream fashion product as easy as scrolling the screen.',
  ),
  onBoardingModel(
    title: 'Get Quality and Guaranteed Items',
    image: CustomAssets.kMidOnboarding,
    subTitle: 'We present high quality products with guaranteed guarantees.',
  ),
  onBoardingModel(
    title: 'Enjoy Free Shipping and Express Shipping',
    image: CustomAssets.klastonboarding,
    subTitle: 'You can enjoy fast delivery without having to pay extra',
  )
];

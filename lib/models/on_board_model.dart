class OnBoardModel {
  final String image, text1, text2;

  OnBoardModel({
    required this.image,
    required this.text1,
    required this.text2,
  });
}

List<OnBoardModel> onboards = [
  OnBoardModel(
    image: 'assets/onboard_1.png',
    text1: "Grab your\nDelicious food !",
    text2: "Delivery food in your phone",
  ),
  OnBoardModel(
    image: 'assets/onboard_2.png',
    text1: "Grab your\nDelicious food !",
    text2: "Delivery food in your phone",
  ),
  OnBoardModel(
    image: 'assets/onboard_3.png',
    text1: "Grab your\nDelicious food !",
    text2: "Delivery food in your phone",
  ),
];

class LogoModel {
  String image;
  int color;

  LogoModel(this.image, this.color);
}

List<LogoModel> logos = logosData
    .map((item) => LogoModel(item['image'], item['color']))
    .toList();

var logosData = [
  {"image": "assets/images/vivanta.png", "color":  0xFFFFFFFF,},
];

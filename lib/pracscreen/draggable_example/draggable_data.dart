enum GenderType { male, female }

class Genders {
  final String imageUrl;
  final GenderType type;

  Genders({
    required this.imageUrl,
    required this.type,
  });
}

final allGenders = [
  Genders(
    type: GenderType.male,
    imageUrl: 'assets/draggable/male1.jpeg',
  ),
  Genders(
    type: GenderType.male,
    imageUrl: 'assets/draggable/male2.jpeg',
  ),
  Genders(
    type: GenderType.male,
    imageUrl: 'assets/draggable/male3.jpeg',
  ),
  Genders(
    type: GenderType.female,
    imageUrl: 'assets/carousel/karina.png',
  ),
  Genders(
    type: GenderType.female,
    imageUrl: 'assets/carousel/chaewon.png',
  ),
  Genders(
    type: GenderType.female,
    imageUrl: 'assets/carousel/nageong.jpeg',
  ),
];

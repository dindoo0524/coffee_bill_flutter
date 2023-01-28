class OrderModel {
  final int drinkSeq, drinkType;
  final String drinkName, optionDescription;

  OrderModel.fromJson(Map<String, dynamic> json)
      : drinkSeq = json['drinkSeq'],
        drinkType = json['drinkType'],
        drinkName = json['drinkName'],
        optionDescription = json['optionDescription'];
}

class DeliveryModel {
  final String typeDeliveryName;
  final int timeDelivery;
  bool isSelected;

  DeliveryModel(
      {required this.typeDeliveryName,
        required this.timeDelivery,
        required this.isSelected});

  static List<DeliveryModel> getListDelivery() {
    List<DeliveryModel> listDelivery = [
      DeliveryModel(
          typeDeliveryName: 'доставка до дома, адрес:',
          timeDelivery: 30,
          isSelected: true),
      DeliveryModel(
          typeDeliveryName: 'заберу сам в главном кафе Delicious ',
          timeDelivery: 0,
          isSelected: false),
      DeliveryModel(
          typeDeliveryName: 'отправить в точку сети Delicious по адресу:',
          timeDelivery: 20,
          isSelected: false),
    ];
    return listDelivery;
  }
}

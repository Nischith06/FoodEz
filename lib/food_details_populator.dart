// ignore_for_file: camel_case_types, non_constant_identifier_names

class food_details {
  final String name;
  final int price;
  final String details;
  final int image_num;
  final String type;
  final String canteen;
  final String ingredients;

  food_details(
      {required this.name,
      required this.price,
      required this.details,
      required this.image_num,
      required this.type,
      required this.canteen,
      required this.ingredients});
}

class canteen_details {
  final String name;
  final int image_num;
  canteen_details({required this.name, required this.image_num});
}

class cart_elements {
  final String name;
  final double Price;
  final int quantity;
  final double total_price;
  final int image_number;
  cart_elements(
      {required this.name,
      required this.Price,
      required this.quantity,
      required this.total_price,
      required this.image_number});
}

class cart_food_details {
  final String food_name;
  final int price;
  final int image_num;
  int quantity;
  int total_price;
  cart_food_details(
      {required this.food_name,
      required this.price,
      required this.quantity,
      required this.total_price,
      required this.image_num});
}

final List<String> payment_status = ["Paid", "Processing"];
final List<String> order_status = [
  "Placed",
  "Processing",
  "Recived",
  "Cancelled"
];

class Orders {
  final String f_name;
  final double price;
  final int quantity;
  final String payment_Status;
  final String order_Status;
  final String canteen_Name;
  final int image_num;

  Orders(
      {required this.f_name,
      required this.price,
      required this.quantity,
      required this.payment_Status,
      required this.order_Status,
      required this.canteen_Name,
      required this.image_num});
}

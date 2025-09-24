import "dart:io";

void main(List<String> args) {
  Manager.welcome();
}


class Product {
  String name;
  int amount;
  double price;

  Product(this.name, this.amount, this.price);

  String get productPrice {
      return "Price: \$$price";
  }

  String get productName {
      return 'Name: $name';
  }

  String get productAmount {
    return 'There are/is $amount in stock';
  }
}


class Manager {
  static void welcome() {
    print("?    ?    ? ???? ?     ???  ??????");
    print("?   ? ?   ? ?    ?    ?   ? ?    ?");
    print("?  ?   ?  ? ???? ?    ?     ?    ?");
    print("? ?     ? ? ?    ?    ?     ?    ?");
    print("??       ?? ?    ?    ?   ? ?    ?");
    print("?         ? ???? ????  ???  ??????");

    print("Menu Manager:");
    print("1-Create Product");
    print("2-Edit Product");
    print("3-Delete Product");
    print("4-See all current Prodcuts");

    stdout.write("Choose a number:");

    while (true) {
      try {
        String? selection = stdin.readLineSync();
        int? intSelection = int.parse(selection ?? "");
      } catch (e, s) {
        print("Exception: $e");
        stdout.write("Try again, please:");
        continue;
      }
      break;
    }
  }

  static void createProduct() {
    stdout.write("Enter Name Product: ");
    String? name = stdin.readLineSync();
  }
}


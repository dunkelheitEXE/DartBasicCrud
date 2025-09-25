import "dart:io";

void main(List<String> args) {
  print("?    ?    ? ???? ?     ???  ??????");
  print("?   ? ?   ? ?    ?    ?   ? ?    ?");
  print("?  ?   ?  ? ???? ?    ?     ?    ?");
  print("? ?     ? ? ?    ?    ?     ?    ?");
  print("??       ?? ?    ?    ?   ? ?    ?");
  print("?         ? ???? ????  ???  ??????");


  while(Manager.programStatus) {
      Manager.welcome();
      print("-------------------------------");
      print("-------------------------------");
      print("\n\n\n");
  }
}


class Product {
  int? id;
  String name;
  double price;
  String category;
  String? description;
  String? color;

  Product(this.name, this.price, this.category) {
    this.id = Manager.autoIncrement ++;
  }

  void set productDescription(String description) {
    this.description = description;
  }
}


class Manager {
  static List<Product> list1 = [];
  static bool programStatus = true;
  static int autoIncrement = 0;
  static void welcome() {
    print("Menu Manager:");
    print("1-Create Product");
    print("2-Search an specific product");
    print("3-Delete Product");
    print("4-See all current Prodcuts");

    stdout.write("Choose a number:");
    int? intSelection;

    while (true) {
      try {
        String? selection = stdin.readLineSync();
        intSelection = int.parse(selection ?? "");
      } catch (e, s) {
        print("Exception: $e");
        stdout.write("Try again, please:");
        continue;
      }
      break;
    }

    if (intSelection == 1) {
      Manager.createProduct();
    } else if (intSelection == 4) {
      Manager.seeAllProducts();
    } else{
      Manager.programStatus = false;
      print("FIN");
    }
  }

  static void createProduct() {
    stdout.write("Enter Name Product: ");
    String? name = stdin.readLineSync();
    stdout.write("Enter the price: ");
    String? strPrice = stdin.readLineSync();
    double price = double.parse(strPrice ?? "");
    Product newProduct = Product("$name", price, "a");
    list1.add(newProduct);
  }

  static void seeAllProducts() {
    print("PRODUCTS AVAILABLE: \n");
    for (var item in list1) {
      String? strPrice = item.price.toString();
      String? strId = item.id.toString();
      String fullItem = "ID: " + strId + " - NAME:" + item.name + " - \$" + strPrice;
      print(fullItem);
    }
  }

  static void search() {
    stdout.write("Search: ");
    String? searching = stdin.readLineSync();
    int idSearched = int.parse(searching ?? "");
  }
}


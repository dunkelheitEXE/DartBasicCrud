import "dart:io";

void main(List<String> args) {
  print("?    ?    ? ???? ?     ???  ??????");
  print("?   ? ?   ? ?    ?    ?   ? ?    ?");
  print("?  ?   ?  ? ???? ?    ?     ?    ?");
  print("? ?     ? ? ?    ?    ?     ?    ?");
  print("??       ?? ?    ?    ?   ? ?    ?");
  print("?         ? ???? ????  ???  ??????");

  Manager.initFive();

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

  void productDescription(String description) {
    this.description = description;
  }

  void productColor(String color) {
    this.color = color;
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
    print("3-See all current products");
    print("other: exit");

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
    } else if (intSelection == 3) {
      Manager.seeAllProducts();
    } else if (intSelection == 2){
      Manager.search();
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
    stdout.write("Write a Category: ");
    String? category = stdin.readLineSync();
    Product newProduct = Product("$name", price, "$category");

    stdout.write("Do you want to set a description (or empty): ");
    String? description = stdin.readLineSync();
    stdout.write("Do you want to set a color (or empty): ");
    String? color = stdin.readLineSync();

    newProduct.productDescription("$description");
    newProduct.productColor("$color");

    list1.add(newProduct);
  }

  static void seeAllProducts() {
    print("PRODUCTS AVAILABLE: \n");
    for (var item in list1) {
      String? strPrice = item.price.toString();
      String? strId = item.id.toString();
      String description = item.description ?? "";
      String color = item.color ?? "";
      String fullItem = "ID: " + strId + " - NAME: " + item.name + " - \$" + strPrice + " - DESCRIPTION: " + description + " - COLOR: " + color;
      print(fullItem);
    }
  }

  static void search() {
    stdout.write("Search: ");
    String? searching = stdin.readLineSync();
    int idSearched = int.parse(searching ?? "");
    Product? foundProduct = list1.where((product) => product.id == idSearched).firstOrNull;
    if(foundProduct != null) {
      print("====================================");
      String description = foundProduct.description ?? "";
      String color = foundProduct.color ?? "";
      String productDesc = "ID: " + foundProduct.id.toString() + " - " + foundProduct.name + " - \$" + foundProduct.price.toString() + " - DESCRIPTION: " + description + " - COLOR: " + color;
      print(productDesc);
      print("====================================");
    } else {
      print("====================================");
      print("Not found");
      print("====================================");
    }
  }

  static void initFive() {
    Product p1 = Product("Laptop", 15000.0, "Electrónica");
    p1.productDescription("Laptop de alto rendimiento con 16GB RAM");
    p1.productColor("Gris");

    Product p2 = Product("Smartphone", 8000.0, "Electrónica");
    p2.productDescription("Pantalla AMOLED 6.5 pulgadas");
    p2.productColor("Negro");

    Product p3 = Product("Silla Gamer", 3500.0, "Muebles");
    p3.productDescription("Silla ergonómica con soporte lumbar");
    p3.productColor("Rojo");

    Product p4 = Product("Reloj Inteligente", 2500.0, "Accesorios");
    p4.productDescription("Monitor de sueño y ritmo cardíaco");
    p4.productColor("Blanco");

    Product p5 = Product("Audífonos Bluetooth", 1200.0, "Electrónica");
    p5.productDescription("Cancelación de ruido activa");
    p5.productColor("Azul");

    list1.add(p1);
    list1.add(p2);
    list1.add(p3);
    list1.add(p4);
    list1.add(p5);
  }
}


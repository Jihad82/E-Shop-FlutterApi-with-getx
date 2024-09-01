
import 'package:get/get.dart';

import '../model/items_model.dart';
import '../services/services.dart';

class ProductConroller extends GetxController {
  var productItems = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productItems.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/get_controller.dart';
import '../model/items_model.dart';
import '../services/bottomNavigationBar.dart';
import 'ProductCard.dart';

class HomeScreen extends StatelessWidget {
  final ProductConroller productConroller = Get.put(ProductConroller());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_add_sharp),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (productConroller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return GridView.builder(
                    itemCount: productConroller.productItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.69,
                    ),
                    itemBuilder: (context, index) {
                      return ProductItemsDisplay(
                        product: productConroller.productItems[index],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

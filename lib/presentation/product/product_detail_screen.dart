import 'package:flutter/material.dart';
import 'package:task/logic/bloc_export.dart';
import 'package:task/utils/utils.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 59, 29),
        centerTitle: true,
        leading: const SizedBox(),
        title: const Text(
          "Product Detail",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
      body: BlocBuilder<SingleCubit, SingleState>(
        builder: (context, state) {
          if (state is SProductsLOading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SProductsLOadError) {
            return Center(child: Text(state.error));
          }

          if (state is SProductsLOaded) {
            var data = state.pdts;
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              children: [
                spaceHeight(10),
                Stack(
                  children: [
                    Image.network(
                      data.imgs[0],
                      height: sH(context) / 3,
                      width: sW(context),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black26),
                        child: Text(
                          "${data.discout.split(".")[0]}\n % off",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Colors.grey[200],
                ),
                spaceHeight(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "₹" + data.price,
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    )
                  ],
                ),
                spaceHeight(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Brand:"),
                        spaceWidth(5),
                        Text(
                          data.brand,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("stock:"),
                        spaceWidth(5),
                        Text(
                          data.stock,
                          style: TextStyle(fontSize: 13, color: Colors.green),
                        )
                      ],
                    )
                  ],
                ),
                spaceHeight(10),
                Text(data.descr,
                    style: const TextStyle(fontSize: 11, color: Colors.grey)),
                spaceHeight(20),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text("Add to cart")),
                spaceHeight(20),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text("Buy Now"))
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task/logic/bloc_export.dart';
import 'package:task/presentation/product/product_detail_screen.dart';
import 'package:task/utils/utils.dart';

class AllProductListScreen extends StatelessWidget {
  const AllProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 59, 29),
        centerTitle: true,
        leading: const SizedBox(),
        title: const Text(
          "Listed Products",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLOading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsLOadError) {
            return Center(child: Text(state.error));
          }

          if (state is ProductsLOaded) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: state.pdts.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[200],
              ),
              itemBuilder: (context, index) {
                var data = state.pdts[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      data.img,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    navigatorKey.currentState!.push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => SingleCubit(
                            apiRepository: context.read<ApiRepository>())
                          ..getSIngle(id: data.id),
                        child: const ProductDetailScreen(),
                      ),
                    ));
                  },
                  title: Text(
                    data.title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    data.cat,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  trailing: Text("₹ ${data.price}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                );
              },
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

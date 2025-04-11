import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_textfield.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/show_snack_bar.dart';

// ignore: must_be_immutable
class UpdataProductPage extends StatefulWidget {
  UpdataProductPage({super.key});
  static String id = 'UpdataProductPage';
  void pickImage() async {}
  Color? color;

  @override
  State<UpdataProductPage> createState() => _UpdataProductPageState();
}

class _UpdataProductPageState extends State<UpdataProductPage> {
  String? productName, description, image, price;
  bool isLoading = false;
  final ImagePicker _picker = ImagePicker();

  pickImage() async {
    final pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 64),
                CustomTextField(
                  onChange: (data) {
                    productName = data;
                  },
                  labelText: 'Product Name',
                  hintText: 'Product Name',
                ),
                SizedBox(height: 15),
                CustomTextField(
                  onChange: (data) {
                    description = data;
                  },
                  labelText: 'description',
                  hintText: 'description',
                ),
                SizedBox(height: 15),
                CustomTextField(
                  onChange: (data) {
                    price = data;
                  },
                  labelText: 'Price',
                  hintText: 'Price',
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                      255,
                      8,
                      85,
                      148,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Update Image",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await pickImage();
                  },
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    //description,
                    try {
                      await updateProduct(product);
                      ShowSnackBar(
                        // ignore: use_build_context_synchronously
                        context,
                        message: 'Product Updated Successfully',
                        color: Colors.green,
                      );
                    } catch (e) {
                      ShowSnackBar(
                        // ignore: use_build_context_synchronously
                        context,
                        message: 'Something went wrong',
                      );
                      debugPrint('error ${e.toString()}');
                    }
                    isLoading = false;
                    setState(() {});
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    UpdateProductService().updateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description:
          description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}

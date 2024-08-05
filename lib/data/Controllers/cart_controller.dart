import 'package:e_commerce_app/Screen/Loader/full_screen_loader.dart';
import 'package:e_commerce_app/data/Model/cart_model.dart';
import 'package:e_commerce_app/data/Model/product_model.dart';
import 'package:e_commerce_app/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  CartController() {
    loadCartItems();
  }
  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      FullScreenLoader.sucessSnackBar(title: 'Select Quantity');
      return;
    }
    final selectedCartItems =
        convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere(
        (cartItems) => cartItems.productId == selectedCartItems.productId);
    if (index >= 0) {
      cartItems[index].quantity = selectedCartItems.quantity;
    } else {
      cartItems.add(selectedCartItems);
    }
    updateCart();
    FullScreenLoader.sucessSnackBar(
        title: "Your Product has been added to the cart");
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void addOneToCart(CartItemModel item) {
    int index =
        cartItems.indexWhere((element) => element.productId == item.productId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void subOneToCart(CartItemModel item) {
    int index =
        cartItems.indexWhere((element) => element.productId == item.productId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCart(index)
            : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  void removeFromCart(int index) {
    Get.defaultDialog(
        title: 'Remove Product',
        middleText: 'Are you sure you want to remove this product?',
        onConfirm: () {
          cartItems.removeAt(index);
          updateCart();
          FullScreenLoader.sucessSnackBar(
              title: '', message: 'Product remove from the cart');
          Get.back();
        },
        onCancel: ()=> ()=> Get.back ()
        );
  }

  void updateCartTotals() {
    double calculated = 0.0;
    int NoOfItems = 0;
    for (var items in cartItems) {
      calculated += (items.price) * items.quantity.toDouble();
      NoOfItems += items.quantity;
    }
    totalCartPrice.value = calculated;
    noOfCartItems.value = NoOfItems;
  }

  void saveCartItems() {
    final cartItemsStrings =
        cartItems.map((element) => element.toJson()).toList();
    SLocalStorage.instance().saveData('cartItems', cartItemsStrings);
  }

  void loadCartItems() {
    final cartItemsString =
        SLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemsString != null) {
      cartItems.assignAll(cartItemsString
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((p0) => p0.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }
void updateAllreadyAddedProductCOunt(ProductModel product){
  
}
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    return CartItemModel(
        productId: product.id,
        title: product.title,
        quantity: quantity,
        price: product.price,
        image: product.images,
        brandName: product.brand!.name);
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}

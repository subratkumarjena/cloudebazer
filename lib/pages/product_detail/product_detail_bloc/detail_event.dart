abstract class DetailEvent{}

class AddToCartEvent extends DetailEvent{
  int productId;
  int qty;
  AddToCartEvent({required this.productId, required this.qty});
}
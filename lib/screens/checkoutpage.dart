import 'package:flutter/material.dart';
import 'package:furniture/provider/cartprovider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Prov=Provider.of<Cartprovider>(context);
    return Scaffold(
      backgroundColor: const Color(0xffF7F6F2),
      appBar: AppBar(
        backgroundColor: const Color(0xffF7F6F2),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// DELIVERY ADDRESS
            _infoCard(
              title: 'Delivery Address',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adeyemi Animashaun',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '123 Green Street, New York,\nNY 10001, USA',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Change',
                      style: TextStyle(
                        color: Color(0xff2E7D32),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            /// PAYMENT METHOD
            _infoCard(
              title: 'Payment Method',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '•••• •••• •••• 4242',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Visa',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Change',
                      style: TextStyle(
                        color: Color(0xff2E7D32),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            /// ORDER SUMMARY
            const Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _summaryRow('Subtotal', '\$'+ Prov.Total().toString()),
            const SizedBox(height: 12),
            _summaryRow('Delivery Fee', '\$30.00'),
            const SizedBox(height: 12),
            _summaryRow(
              'Discount',
              '-\$50.00',
              isDiscount: true,
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),

            _summaryRow(
              'Total',
              '\$'+ (Prov.Total()+30-50).toString(),
              isTotal: true,
            ),

            const Spacer(),

            /// PLACE ORDER BUTTON
            Container(
              height: 62,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffFBC02D),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 28),
                  const Text(
                    'Place Order',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }

  Widget _summaryRow(
    String title,
    String value, {
    bool isDiscount = false,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 22 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 28 : 16,
            fontWeight: FontWeight.bold,
            color: isDiscount
                ? const Color(0xff2E7D32)
                : Colors.black,
          ),
        ),
      ],
    );
  }
}

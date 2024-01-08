import 'package:flutter/material.dart';
import 'package:shahadmartapplication/components/components/cart_counter.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/screens/payment_screens/Manual%20payment.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';

class CartScreenWithData extends StatefulWidget {
  const CartScreenWithData({super.key});

  @override
  State<CartScreenWithData> createState() => _CartScreenWithDataState();
}

class _CartScreenWithDataState extends State<CartScreenWithData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'السلة',
              style: headerTextStyle,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CartCounterWidget(),
            const SizedBox(
              height: 20,
            ),
      //-------- discount section
      
            Row(
              children: [
                // اكتب رمز الخصم هنا
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                    border: const Border(
                      top: BorderSide(color: Color(0xffEBF0FF), width: 1.0),
                      bottom: BorderSide(color: Color(0xffEBF0FF), width: 1.0),
                      left: BorderSide(color: Color(0xffEBF0FF), width: 1.0),
                      right: BorderSide(color: Color(0xffEBF0FF), width: 0.0),
                    ),
                  ),
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: 'اكتب رمز الخصم هنا',
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                          alignLabelWithHint: true,
                          hintStyle: smallTextStyle(Colors.grey),
                          border: InputBorder.none)),
                ),
                // done button
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xff40BFFF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  height: 50,
                  width: 70,
                  child: Text(
                    'تم',
                    style: smallTextStyle(Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
      
      //--------- payment coount total count section
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffEBF0FF), width: 2.0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    // number of items
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '100 \$',
                          style:smallTextStyle(Colors.black),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '(٢) القطع',
                          style: smallTextStyle(Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // total discount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '100 \$',
                          style: smallTextStyle(Colors.black),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'مجموع الخصم',
                          style: smallTextStyle(Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // total delevery price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '100 \$',
                          style: smallTextStyle(Colors.black),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'قيمة الشحن',
                          style: smallTextStyle(Colors.grey),
                        ),
                      ],
                    ),
                    // doted divder
                    const Divider(
                      color: Color(0xffEBF0FF),
                      height: 20,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // total price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '100 \$',
                          style: smallTextStyle(Colors.blue),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'المجموع الكلي',
                          style: smallTextStyle(Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
      // ------  payment button
      
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size(200, 50),
              ),
              onPressed: () {
                //--- payment method snackbar
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'اختر طريقة الدفع',
                                style: headerTextStyle,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //----- zain cash
                              ListTile(
                                trailing: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage('assets/images/zain.png'),
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                                subtitle: const Text(
                                  textDirection: TextDirection.rtl,
                                  'دفع بطريقة الزين كاش',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Cairo',
                                    fontSize: 10,
                                  ),
                                ),
                                title: Text(
                                  textDirection: TextDirection.rtl,
                                  'زين كاش ',
                                  style: headerTextStyle,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              dividerWidget(),
                              //---- master card
                              ListTile(
                                trailing: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/mastercard.png'),
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                                title: Text(
                                  textDirection: TextDirection.rtl,
                                  'ماستر كارد',
                                  style: headerTextStyle,
                                ),
                                subtitle: const Text(
                                  textDirection: TextDirection.rtl,
                                  'دفع بطريقة الزين كاش',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Cairo',
                                    fontSize: 10,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              dividerWidget(),
                              //---- handed paymeny
                              ListTile(
                                trailing: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/handpayment.png'),
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                                title: Text(
                                  textDirection: TextDirection.rtl,
                                  'دفع باليد',
                                  style: headerTextStyle,
                                ),
                                subtitle: const Text(
                                  textDirection: TextDirection.rtl,
                                  'دفع بطريقة الزين كاش',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Cairo',
                                    fontSize: 10,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ManualPayment()));
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Text(
                'الدفع',
                style: headerTextStyleWhite,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

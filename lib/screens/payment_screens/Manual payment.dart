import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/screens/payment_screens/don_screen.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';

class ManualPayment extends StatefulWidget {
  const ManualPayment({super.key});

  @override
  State<ManualPayment> createState() => _ManualPaymentState();
}

class _ManualPaymentState extends State<ManualPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'دفع يدوي',
          style: headerTextStyle,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
            child: Text(
              'معلومات الدفع اليدوي',
              style: headerTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
         
         Column(
           children: [ 
            //----- name textfield section
            manualPaymentWidget(
              TextInputType.name,
              'حقل الاسم فارغ',
              'الاسم الثلاثي'
            ),
       //-----insta account name textfield section
               manualPaymentWidget(
              TextInputType.name,
                'حقل حساب الانستا فارغ',
              'اسم حساب الانستا'
            ),
       //-----city name textfield section
            manualPaymentWidget(
              TextInputType.name,
                'حقل المدينة فارغ',
              'المدينة'
            ),
              //-----  address textfield section
            manualPaymentWidget(
              TextInputType.name,
                'حقل العنوان فارغ',
              'العنوان'
            ),
      
          //-----  nearest point textfield section
          manualPaymentWidget(
              TextInputType.name,
                'حقل اقرب نقطة دالة فارغ',
              'اقرب نقطة دالة'
            ),
          const SizedBox(height: 50,),

          // confirm button
       ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
              context,
               MaterialPageRoute(
                  builder: (BuildContext context) =>const DonePayment()));
                },
                child: Text(
                  'الاستمرار',
                  style: headerTextStyleWhite,
                ),
              )
           ],
         )
        ]),
      ),
    );
  }
}

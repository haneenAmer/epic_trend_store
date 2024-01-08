import 'package:flutter/material.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/widgets/widgets.dart';

class EditeUserProfileScreen extends StatefulWidget {
 
  const EditeUserProfileScreen({
    Key? key,
    
    });

  @override
  State<EditeUserProfileScreen> createState() => _EditeUserProfileScreenState();
}

class _EditeUserProfileScreenState extends State<EditeUserProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController paymentMethodController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'تعديل المعلومات الشخصية',
              style: headerTextStyle,
              textAlign: TextAlign.start,
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child:const Icon(Icons.arrow_back),
        ),
        ),
        body: SingleChildScrollView(
           physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  // --- background image
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/profilebg.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  //--- header section
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 0),
                    child: Column(
                      children: [
                        // edite the name of user
                        editeUserInfoWidget(
                            Icons.person, 'الاسم الثلاثي', nameController),
                        //--- edit email
                        editeUserInfoWidget(Icons.email_outlined,
                            'الايميل الخاص بك', emailController),
                        //--- edit phone number
                        editeUserInfoWidget(Icons.phone_android_outlined,
                            ' رقم الهاتف', phoneNumberController),

                        //--- edit address
                        editeUserInfoWidget(Icons.home_outlined, 'عنوان سكنك',
                            addressController),
                        //--- edit payment method
                        editeUserInfoWidget(Icons.payment_outlined,
                            'طريقة الدفع', paymentMethodController),

                        //--- edit city
                        editeUserInfoWidget(Icons.location_on_outlined,
                            'اضافة المدينة', cityController),

                        //--- save button
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 30,
                    right: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: const Size(100, 50),
                      ),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => const ()));
                      },
                      child: Text(
                        'حفظ التعديلات',
                        style: headerTextStyleWhite,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

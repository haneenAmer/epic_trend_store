import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';


// provider declare
final helloWorldProvider = Provider((_) => 'Hellow Bro');

final counterProvider = StateProvider<int>((ref) {
  return 0;
});


class CartCounterWidget extends ConsumerWidget {
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final int valueCounter = ref.watch(counterProvider);
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            // --- image section
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Image.asset('assets/images/sportshoes.png'),
            ),
            // --- details ROW

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //--- name and price section
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('اسم المنتج', style: smallTextStyle(Colors.black),),
                      Text(
                        '\$ السعر',
                        style: smallTextStyle(Colors.blue),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  // --- trash and counter section
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.delete_outline, color: Colors.grey),   
                          Row(
                            children: [
                              // decrease counter
                              GestureDetector(
                               onTap: () {
                      if (valueCounter > 0) {
                                ref.read(counterProvider.notifier)
                                  .update((state) => state - 1);
                              }
                    },
                                child: Container(
                                  height: 25,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      bottomLeft: Radius.circular(4),
                                    ),
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          color: Color(0xffEBF0FF),
                                          width: 1.0),
                                      bottom: BorderSide(
                                          color: Color(0xffEBF0FF),
                                          width: 1.0),
                                      left: BorderSide(
                                          color: Color(0xffEBF0FF),
                                          width: 1.0),
                                      right: BorderSide(
                                          color: Color(0xffEBF0FF),
                                          width: 0.0),
                                    ),
                                  ),
                                  child: const Text(
                                    '-',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              // counter
                              Container(
                                height: 25,
                                width: 30,
                                decoration: const BoxDecoration(
                                  color: Color(0xffEBF0FF),
                                ),
                                child: Text(
                                  valueCounter.toString(),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              // increase counter
                              GestureDetector(
                                onTap: () {
                                  ref
                          .read(counterProvider.notifier)
                          .update((state) => state + 1);
                                },
                                child: Container(
                                  height: 25,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          color: Color(0xffEBF0FF),
                                          width: 1.0),
                                      bottom: BorderSide(
                                          color: Color(0xffEBF0FF),
                                          width: 1.0),
                                      left: BorderSide(
                                          color: Color(0xffEBF0FF),
                                          width: 0.0),
                                      right: BorderSide(
                                          color: Color(0xffEBF0FF),
                                          width: 1.0),
                                    ),
                                  ),
                                  child: const Text(
                                    '+',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )
                        
                      
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

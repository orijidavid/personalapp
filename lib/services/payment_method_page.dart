import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {

  int num1 = 5000;
  int num2 = 750;
  int num3 = 100;
  int get subTotal => (num1+num2+num3);
  double get salesTax => 0.08 * (num1+num2+num3);
  double get shippingFee => 0.03 * (num1+num2+num3);
  double get total => subTotal+salesTax+shippingFee;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payments"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8), //achieved using the wrap functionality of Android Studio
          child: Column(
              children: [
                Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Confirm Order", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),),

                      Icon(
                        Icons.account_circle_outlined,
                        size: 35,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 5,),

                Divider(
                  color: Colors.grey,   // Line color
                  thickness: 1,         // Line thickness
                  indent: 0,           // Empty space before the line starts
                  endIndent: 0,        // Empty space after the line ends
                ),

                SizedBox(height: 10,),

                Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      //first row template
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.wallet,
                                color: Colors.black,
                                size: 30,
                              ),

                              SizedBox(width: 5,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(       //overflow feature for can only be used in SizedBox
                                    width: 200,
                                    child: Text("Credit Subscription",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),


                                  Text("1x per month", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ],
                              ),
                            ],
                          ),

                          Text("N${num2+num3}", style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),),

                        ],
                      ),

                      SizedBox(height: 25,),

                      //second row template
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.gamepad_outlined,
                                color: Colors.black,
                                size: 30,
                              ),

                              SizedBox(width: 5,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(       //overflow feature for can only be used in SizedBox
                                    width: 200,
                                    child: Text("50 Jewels",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),


                                  Text("1x Purchase", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ],
                              ),
                            ],
                          ),

                          Text("N${num1}", style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),),

                        ],
                      ),

                      SizedBox(height: 25,),

                      //third row template
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.gif_box_outlined,
                                color: Colors.black,
                                size: 30,
                              ),

                              SizedBox(width: 5,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(       //overflow feature for can only be used in SizedBox
                                    width: 200,
                                    child: Text("Wallpaper Purchase",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),


                                  Text("7x Purchase", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ],
                              ),
                            ],
                          ),

                          Text("N${num2}", style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),),

                        ],
                      ),

                      SizedBox(height: 25,),

                      Divider(
                        color: Colors.grey,   // Line color
                        thickness: 1,         // Line thickness
                        indent: 0,           // Empty space before the line starts
                        endIndent: 0,        // Empty space after the line ends
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),

                Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal"),
                      Text("N$subTotal"),
                    ],
                  ),
                ),

                Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping"),
                      Text("N$shippingFee"),
                    ],
                  ),
                ),

                Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sales Tax"),
                      Text("N$salesTax"),
                    ],
                  ),
                ),

                Divider(
                  color: Colors.grey,   // Line color
                  thickness: 1,         // Line thickness
                  indent: 0,           // Empty space before the line starts
                  endIndent: 0,        // Empty space after the line ends
                ),

                Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      Text("N$total", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    ],
                  ),
                ),

                SizedBox(height: 20,),

                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: const Text('Pay', style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
            ]
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrdersHistoryPage extends StatefulWidget {
  const OrdersHistoryPage({super.key});

  @override
  State<OrdersHistoryPage> createState() => _OrdersHistoryPageState();
}

class _OrdersHistoryPageState extends State<OrdersHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Orders History"),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [

            Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 14, vertical: 0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text("Total you've spent in October", style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  )),

                  SizedBox(height: 20,),

                  Text("₦0", style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  )),

                  SizedBox(height: 15,),

                  Text("Your budget only applies to this account, and you can change it anytime", style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  )),

                  SizedBox(height: 14,),

                  Text("Set Budget", style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  )),

                  SizedBox(height: 10,),

                  Divider(
                    color: Colors.grey,   // Line color
                    thickness: 1,         // Line thickness
                    indent: 0,           // Empty space before the line starts
                    endIndent: 0,        // Empty space after the line ends
                  ),

                  SizedBox(height: 10,),

                  //order elements template
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: ColoredBox(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                              Text("September", style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            )),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.card_giftcard,
                                  color: Colors.black,
                                  size: 60,
                                ),

                                SizedBox(width: 10,),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("YouTube Premium", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    )),

                                    Text("September 7, 2026", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    )),
                                  ],
                                ),

                                SizedBox(width: 10,),

                                Text("₦1,300.00", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,

                                  fontWeight: FontWeight.w700,
                                )),
                              ],
                            ),
                          ],
                      ),
                    ),
                  ),

                  SizedBox(height: 14,),

                  //broken codeblock
                 /* Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("August", style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      )),

                      Row(
                        children: [
                          Icon(
                            Icons.account_balance_wallet,
                            color: Colors.black,
                            size: 60,
                          ),
                          SizedBox(width: 10,),
                          Text("Deposit", style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          )),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("₦2,000.00", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text("August 15, 2026", style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      )),
                    ],
                  ),*/

                  //second order template
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: ColoredBox(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("August", style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          )),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.wallet,
                                color: Colors.black,
                                size: 60,
                              ),

                              SizedBox(width: 10,),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 72, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                   Text("Deposit",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    )),

                                    Text("August 20, 2026", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    )),
                                  ],
                                ),
                              ),

                              SizedBox(width: 10,),

                              Text("₦2,000.00", style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 14,),

                  //third order template
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: ColoredBox(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.network_wifi,
                                color: Colors.black,
                                size: 60,
                              ),

                              SizedBox(width: 10,),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 85, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("VPN Plus",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        )),

                                    Text("August 3, 2026", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    )),
                                  ],
                                ),
                              ),

                              SizedBox(width: 10,),

                              Text("₦700.00", style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 14,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

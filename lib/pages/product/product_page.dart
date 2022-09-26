import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_management_flutter/widgets/multiline_textfield_widget.dart';

import '../../style/text_style.dart';
import '../../utils/app_colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/input_field.dart';
import 'dart:io';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final items = ['Toner', 'Ribbon', 'Ink Refill', 'CC Camera'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectPlatform(),
    );
  }

  Widget _selectPlatform(){
    if(Platform.isAndroid || Platform.isIOS){
      return _mobile();
    }
    else{
      return _desktop();
    }
  }

  Widget _mobile(){
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04, bottom: MediaQuery.of(context).size.width * 0.04, left: MediaQuery.of(context).size.width * 0.045, right: MediaQuery.of(context).size.width * 0.045),
            width: double.infinity,
            color: AppColors.mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(FontAwesomeIcons.angleLeft, color: Colors.white,),
                    SizedBox(width: 10,),
                    Image.asset('assets/images/logo.jpg', width: 24,),
                    SizedBox(width: 10,),
                    BigText(text: 'Staff', color: Colors.white,),
                  ],
                ),
                Row(children: [
                  BigText(text: 'Add Product', color: Colors.white,),
                  SizedBox(width: 10,),
                  Icon(FontAwesomeIcons.box, color: Colors.white,),
                ],)
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: Offset(1, 10),
                      color: Colors.grey.withOpacity(0.2)
                  ),
                ],
                borderRadius: BorderRadius.circular(15)
            ),
            child: TextField(
              onChanged: (value){
                //_runFilter(value);
              },
              decoration: InputDecoration(
                hintText: 'Search Product...',
                prefixIcon: Icon(Icons.search,
                  color: AppColors.mainColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      width: 1.0,
                      color: Colors.white
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      width: 1.0,
                      color: Colors.white
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
              child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(5,10),
                                color: Colors.grey.withOpacity(0.4)
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: 'Toner Model - HP CE285A / CRG – 325 HP CB435A / CRG – 312 HP CB436A /CRG-313/713 HP CE278A/CRG – 328/326 HP CC388A. Printer Model - P1102 / P1102W / M1132MFP / M1212NF LBP – 6000 / 6030 P1005 / P1006 LBP – 3010 / 3100 / 3018 / 3108 / 3050 / 3150 / 3010 P1505 / P1505N / M1120 / M1522N / M1522NF / CANON LBP–3250 P1566 / P1606DN / M1536DNF / LBP – 6200D / 6230 P1007 / P1008 / Pro M1136 / M1213nf / M1216'),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              BigText(text: 'Stock: ', fontWeight: FontWeight.w400, color: Colors.grey[700], size: 16,),
                              BigText(text: '50', fontWeight: FontWeight.w400, color: Colors.grey[700],size: 16,),
                            ],
                          ),

                          Row(
                            children: [
                              BigText(text: 'Category : ', fontWeight: FontWeight.w400, color: Colors.grey[700], size: 16,),
                              BigText(text: 'Toner', fontWeight: FontWeight.w400, color: Colors.grey[700],size: 16,),
                            ],
                          ),

                          SizedBox(height: 5,),
                          Row(
                            children: [
                              BigText(text: 'Price: ', fontWeight: FontWeight.w600, color: Colors.grey[900], size: 20,),
                              BigText(text: '615', fontWeight: FontWeight.w600, color: Colors.grey[900],size: 20,),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(bottom: 10, top: 10),
                            child: Center(
                              child: BigText(text: 'Edit', color: AppColors.mainColor,),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                );
              }))
        ],
      ),
    );
  }

  Widget _desktop(){
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.mainColor,
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/logo.jpg', width: 30,),
                    SizedBox(width: 10,),
                    BigText(text: 'Product', color: Colors.white,),
                  ],
                ),
                Row(
                  children: [
                    BigText(text: 'Dashboard', color: Colors.white,),
                    SizedBox(width: 10,),
                    BigText(text: 'Profile', color: Colors.white,),
                    SizedBox(width: 10,),
                    BigText(text: 'Logout', color: Colors.white,),
                    Icon(Icons.logout_outlined, color: Colors.white,)
                  ],
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(0,0),
                          color: Colors.grey.withOpacity(0.4)
                      )
                    ]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    BigText(text: 'Add Product', fontWeight: FontWeight.bold,),
                    SizedBox(height: 20,),
                    Icon(FontAwesomeIcons.box, size: 50),
                    MultilineTexfieldWidget(title: 'Product name', hint: 'product name'),
                    MultilineTexfieldWidget(title: 'Description', hint: 'product description'),
                    MyInputField(title: 'Price', hint: 'product price'),
                    MyInputField(title: 'Stock', hint: 'stock'),
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Category',
                            style: titleStyle,
                          ),
                          Container(
                              height: 50,
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    isExpanded: true,
                                    value: value,
                                    items: items.map(buildMenuItem).toList(),
                                    onChanged: (value){
                                      setState(() {
                                        this.value = value;
                                      });
                                    }
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.mainColor,

                      ),
                      child: Center(child: Text('Add', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)),
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      // Search
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: Offset(1, 10),
                                  color: Colors.grey.withOpacity(0.2)
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: TextField(
                          onChanged: (value){
                            //_runFilter(value);
                          },
                          decoration: InputDecoration(
                            hintText: 'Search Staff...',
                            prefixIcon: Icon(Icons.search,
                              color: AppColors.mainColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: Colors.white
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: Colors.white
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        color: AppColors.mainColor,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.08,
                              child: Text(''),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.24,
                              child: Center(child: BigText(text: 'Product Name', color: Colors.white,)),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.09,
                              child: Center(child: BigText(text: 'Category', color: Colors.white,)),
                            ),
                            Container(
                              width:  MediaQuery.of(context).size.width * 0.09,
                              child: Center(child: BigText(text: 'Stock', color: Colors.white,)),
                            ),
                            Container(
                              width:  MediaQuery.of(context).size.width * 0.09,
                              child: Center(child: BigText(text: 'Price', color: Colors.white,)),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index){
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02, right: MediaQuery.of(context).size.width * 0.02),
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                              child: Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.08,
                                    child: Center(
                                      child: BigText(text: 'Edit', color: AppColors.mainColor,),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.24,
                                    child: Center(child: BigText(text: 'Toner Model - HP CE285A / CRG – 325 HP CB435A / CRG – 312 HP CB436A /CRG-313/713 HP CE278A/CRG – 328/326 HP CC388A. Printer Model - P1102 / P1102W / M1132MFP / M1212NF LBP – 6000 / 6030 P1005 / P1006 LBP – 3010 / 3100 / 3018 / 3108 / 3050 / 3150 / 3010 P1505 / P1505N / M1120 / M1522N / M1522NF / CANON LBP–3250 P1566 / P1606DN / M1536DNF / LBP – 6200D / 6230 P1007 / P1008 / Pro M1136 / M1213nf / M1216',)),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.09,
                                    child: Center(child: BigText(text: 'Toner', )),
                                  ),
                                  Container(
                                    width:  MediaQuery.of(context).size.width * 0.09,
                                    child: Center(child: BigText(text: '50',)),
                                  ),
                                  Container(
                                    width:  MediaQuery.of(context).size.width * 0.09,
                                    child: Center(child: BigText(text: '615',)),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],),
                ),)
            ],
          )
        ],
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
      child: BigText(text: item,)
  );
}

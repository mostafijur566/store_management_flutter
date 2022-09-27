import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/input_field.dart';
import '../../widgets/staff_row.dart';

import 'dart:io';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
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
                    BigText(text: 'Customer', color: Colors.white,),
                  ],
                ),
                Row(children: [
                  BigText(text: 'Add Customer', color: Colors.white,),
                  SizedBox(width: 10,),
                  Icon(FontAwesomeIcons.userPlus, color: Colors.white,),
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
                hintText: 'Search Customer...',
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
          Expanded(child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
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
                          BigText(text: 'Mostafijur Rahman'),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              BigText(text: 'Phone: ', fontWeight: FontWeight.w400, color: Colors.grey[700], size: 16,),
                              BigText(text: '01757261840', fontWeight: FontWeight.w400, color: Colors.grey[700],size: 16,),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              BigText(text: 'Address: ', fontWeight: FontWeight.w600, color: Colors.grey[900], size: 16,),
                              BigText(text: 'CUFL', fontWeight: FontWeight.w600, color: Colors.grey[900],size: 16,),
                            ],
                          ),
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
                    BigText(text: 'Customer', color: Colors.white,),
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
                    BigText(text: 'Add Customer', fontWeight: FontWeight.bold,),
                    SizedBox(height: 20,),
                    Icon(FontAwesomeIcons.userPlus, size: 50),
                    MyInputField(title: 'Name', hint: 'full name'),
                    MyInputField(title: 'Contact', hint: 'contact no.'),
                    MyInputField(title: 'Address', hint: 'address'),
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
                            StaffRow(),
                            StaffRow(title: 'Name'),
                            StaffRow(title: 'Contact No'),
                            StaffRow(title: 'Address')
                          ],
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index){
                            return Container(
                                color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02, right: MediaQuery.of(context).size.width * 0.02),
                                child: Column(
                                  children: [
                                    Padding(padding: EdgeInsets.only(top: 5, bottom: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.14,
                                            child: Center(child: BigText(text: 'View', color: AppColors.mainColor, fontWeight: FontWeight.bold,)),
                                          ),
                                          StaffRow(title: 'Mostafijur Rahman', color: Colors.black,),
                                          StaffRow(title: '01757261840', color: Colors.black,),
                                          StaffRow(title: 'CUFL', color: Colors.black,),
                                        ],
                                      ),
                                    ),
                                    Divider(height: 1,)
                                  ],
                                )
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
}

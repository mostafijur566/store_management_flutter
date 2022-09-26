import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_management_flutter/widgets/multiline_textfield_widget.dart';

import '../../style/text_style.dart';
import '../../utils/app_colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/input_field.dart';

class AddProductMobile extends StatefulWidget {
  const AddProductMobile({Key? key}) : super(key: key);

  @override
  State<AddProductMobile> createState() => _AddProductMobileState();
}

class _AddProductMobileState extends State<AddProductMobile> {

  final items = ['Toner', 'Ribbon', 'Ink Refill', 'CC Camera'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04, bottom: MediaQuery.of(context).size.width * 0.04, left: MediaQuery.of(context).size.width * 0.045, right: MediaQuery.of(context).size.width * 0.045),
                width: double.infinity,
                color: AppColors.mainColor,
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.angleLeft, color: Colors.white,),
                    SizedBox(width: 10,),
                    SizedBox(width: 10,),
                    BigText(text: 'Add Product', color: Colors.white,),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Icon(FontAwesomeIcons.box, size: 50,),
              MultilineTexfieldWidget(title: 'Name', hint: 'product name'),
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
                child: Center(child: BigText(text: 'Create Account', color: Colors.white,)),
              )
            ],
          ),
        ),
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: BigText(text: item,)
  );
}

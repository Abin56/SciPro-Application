import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro/widgets/button_Container.dart';
import 'package:scipro/widgets/newMorphism.dart';

class PopularOnTapDetails extends StatelessWidget {
  const PopularOnTapDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 44, 59),
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            NewMorphismBlackWidget(
                child: Text(''), height: 200, width: double.infinity),
            Container(
              height: 700.h,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ButtonContainerWidget(
                      curving: 30,
                      colorindex: index,
                      height: 200,
                      width: double.infinity,
                      child: Text(''),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 3),
            ),
          ]),
        ),
      ),
    );
  }
}

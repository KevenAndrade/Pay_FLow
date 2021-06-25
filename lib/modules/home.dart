import 'package:flutter/material.dart';
import 'package:pay_flow/controller/home_controller.dart';
import 'package:pay_flow/shared/themes/appcolors.dart';
import 'package:pay_flow/shared/themes/apptextstyles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = new HomeController();
  final pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(152),
          child: Container(
              height: 152,
              color: AppColors.primary,
              child: Center(
                child: ListTile(
                  title: Text.rich(
                    TextSpan(
                        text: "Olá ",
                        style: TextStyles.titleRegular,
                        children: [
                          TextSpan(
                              text: "Keven",
                              style: TextStyles.titleBoldBackground)
                        ]),
                  ),
                  subtitle: Text("Mantenha suas contas em dia",
                      style: TextStyles.captionShape),
                  trailing: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ))),
      body: pages[controller.currentPage],
      bottomNavigationBar: Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                color: AppColors.primary,
                onPressed: () {
                  controller.setPage(0);
                  setState(() {});
                },
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/barcode");
                  },
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.add_box_outlined,
                      color: AppColors.background,
                    ),
                  )),
              IconButton(
                  icon: Icon(Icons.description_outlined),
                  color: AppColors.body,
                  onPressed: () {
                    controller.setPage(1);
                    setState(() {});
                  })
            ],
          )),
    );
  }
}

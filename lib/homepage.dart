import 'package:bombaysign/Pages/appointment_p.dart';
import 'package:bombaysign/Pages/details_page.dart';
import 'package:bombaysign/Pages/service_tab.dart';
import 'package:bombaysign/Pages/sign_tab.dart';
import 'package:flutter/material.dart';

int selectedTab = 0;

PageController? pageController;

class HomePage extends StatefulWidget {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobile;
  HomePage({this.firstName, this.lastName, this.email, this.mobile});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var redColor = Color(0xFFAA0315);

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (i) {
          setState(() {
            selectedTab = i;
          });
        },
        children: <Widget>[
          selectedTab == 0
              ? DetailsTab(
                  firstName: widget.firstName!,
                  lastName: widget.lastName!,
                  email: widget.email!,
                  mobile: widget.mobile!,
                )
              : Center(),
          selectedTab == 1 ? AppointmentTab() : Center(),
          selectedTab == 2 ? ServicesTab() : Center(),
          selectedTab == 3 ? SignInTab() : Center(),
        ],
      ),
    );
  }
}

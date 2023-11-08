import 'package:bombaysign/termspage.dart';
import 'package:bombaysign/theme_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BridalForm extends StatefulWidget {
  @override
  _BridalFormState createState() => _BridalFormState();
}

class _BridalFormState extends State<BridalForm> {
  static var redColor = Color(0xFFAA0315);
  bool isTermsAgreed = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstController = TextEditingController();
  final _lastController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _zipController = TextEditingController();
  final _dateController = TextEditingController();
  final pickUpTimeController = TextEditingController();
  var fieldTheme = ThemeData(
    primaryColor: redColor,
    hintColor: Colors.black87,
  );

  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "This field is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return "";
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String? formatted, tms;
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var now = new DateTime.now();
        var formatter = new DateFormat('yyyy-MM-dd');
        formatted = formatter.format(picked);
        print('formated date: $formatted');
        _dateController.text = formatted!;
        print(picked);
      });
  }

  String validateZip(String value) {
    if (value.length == 0) {
      return "This field is Required";
    }
    return "";
  }

//Time Picker
  Future<Null> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context,   child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: Theme(
            data: ThemeColor.timePicker,
            child: child!,
          ),
        );
      },
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        TimeOfDay now = picked;
        final n = new DateTime.now();
        var pp = '${now.hour}:${now.minute}:00';
        var finalTime = DateFormat.jm()
            .format(DateTime(n.year, n.month, n.day, now.hour, now.minute));
        print('final time $finalTime');
        tms = pp.toString();
        pickUpTimeController.text = finalTime;
      });
  }

  String validateMobile(String value) {
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Mobile Number";
    } else {
      return "";
    }
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return "";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/b4.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: _form(context),
        ),
      ),
    );
  }

  _form(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.2),
          blurRadius: 14.0,
          offset: Offset(6.0, 6.0),
        )
      ]),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Image.asset(
                'images/bomlogo.png',
                fit: BoxFit.cover,
                width: 230,
                height: 135,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Bridal Contract',
                style: TextStyle(
                    color: redColor, fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ), // 160
                          Text(
                            "Congratulations \nand \nThank you for your interest in bridal services\nAt\nBombay Salon & Spa!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "In this package, you will find a list of our essential beauty services offered. Also included are our intake forms and bridal contract. We also offer a consultation and trial session for the bride to determine the right cosmetic color application and hair style desired. You may bring a photo of the desired hairstyle. Once you decide, you are required to submit the contract with a deposit.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Divider(
                            thickness: 2.0,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "Menu of Services",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),

                          //FOR GUEST
                          Text(
                            "Guest",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    _data(),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    _dataItems(),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          //FOR BRIDE
                          SizedBox(height: 10.0),
                          Text(
                            "Bride",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Complete Package (includes Hairstyle, Makeup, and Saree draping, and jewelry dressing) \$250",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "(To determine the right cosmetic color application and hair style desired)",
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    _bride(),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    _brideItems(),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          //FOR HENNA
                          SizedBox(height: 10.0),
                          Text(
                            "Henna",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    _heena(),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    _heenaItems(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          //FOR HENNA
                          SizedBox(height: 10.0),
                          Text(
                            "On Loaction Service",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\$50 up to one hour",
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      "Total Travel fee will be determined prior to booking by distance and location. All parking fees, if required to travel to your hotel room, must be paid with cash or validation.",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40.0),
                          Text(
                            "CONTRACT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Flexible(
                                child: Theme(
                                  data: fieldTheme,
                                  child: TextFormField(
                                    controller: _firstController,
                                    validator: (val){
                                      validateName(val!);
                                    },
                                    onSaved: (  val) {
                                      //firstName = val;
                                    },
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black87),
                                    cursorColor: Colors.black87,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 11.0, 20.0, 11.0),
                                      hintText: "Full Name",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Flexible(
                                child: Theme(
                                  data: fieldTheme,
                                  child: TextFormField(
                                    onSaved: (  val) {
                                      //firstName = val;
                                    },
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black87),
                                    cursorColor: Colors.black87,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 11.0, 20.0, 11.0),
                                      hintText: "Contact Number",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Flexible(
                                child: Theme(
                                  data: fieldTheme,
                                  child: TextFormField(
                                    controller: _firstController,
                                    validator: (val){
                                      validateName(val!);
                                    },
                                    onSaved: (  val) {
                                      //firstName = val;
                                    },
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black87),
                                    cursorColor: Colors.black87,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 11.0, 20.0, 11.0),
                                      hintText: "Address",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Flexible(
                                child: Theme(
                                  data: fieldTheme,
                                  child: TextField(
                                    controller: _dateController,
                                    onTap: () => _selectDate(context),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20.0),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 11.0, 10.0, 11.0),
                                      hintText: "Select Date",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 22.0,
                          ),
                          Theme(
                            data: fieldTheme,
                            child: TextField(
                              controller: pickUpTimeController,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0),
                              onTap: () {
                                _selectTime(context);
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 11.0, 10.0, 11.0),
                                hintText: "Select Time",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Theme(
                                  data: fieldTheme,
                                  child: TextFormField(
                                    controller: _mobileController,
                                    validator: (val){
                                      validateMobile(val!);
                                    },
                                    onSaved: (  val) {
                                      //mobile = val;
                                    },
                                    keyboardType: TextInputType.phone,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20.0),
                                    cursorColor: Colors.black87,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 11.0, 20.0, 11.0),
                                      hintText: "Enter Location",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ]),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    activeColor: redColor,
                    value: isTermsAgreed,
                    onChanged: (value) {
                      isTermsAgreed = value!;
                      setState(() {});
                    },
                  ),
                  Text(
                    'I agree to the salon',
                    style: TextStyle(color: redColor, fontSize: 24.0),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(
                            color: Colors.black87,
                            decoration: TextDecoration.underline,
                            fontSize: 24.0),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => TermsPage()));
                          }),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OutlinedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 110,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.arrow_back_ios,
                              color: redColor,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'PREV',
                              style: TextStyle(color: redColor, fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onPressed: () {
                      // setState(() {
                      //   selectedTab = 2;
                      // });
                      // _pageController.animateToPage(2,
                      //     duration: Duration(milliseconds: 500),
                      //     curve: Curves.decelerate);
                    },
                  ),
                  Material(
                    color: redColor,
                    borderRadius: BorderRadius.circular(10.0),
                    child: MaterialButton(
                      minWidth: 200,
                      padding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                      child: Text("Submit",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0).copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

// FOR GUEST
  List<String> guests = [
    "Hairstyle/Updo",
    "Flat Iron or Blow-dry Style",
    "Makeup Application",
    "Eye Makeup",
    "Eyelashes (Strip)",
    "Saree draping",
  ];
  List<String> guestItem = [
    "\$55 & up (depends on length and thickness of hair)",
    "\$35 & up (depends on length and thickness of hair)",
    "\$50 & up",
    "\$25 & up",
    "\$15",
    "\$25"
  ];
  _data() {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        primary: false,
        itemCount: guests.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              guests[index].toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }

  _dataItems() {
    return SizedBox(
      height: 230.0,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        primary: false,
        itemCount: guestItem.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              guestItem[index].toString(),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          );
        },
      ),
    );
  }

  // FOR BRIDE
  List<String> bride = [
    "Bridal Trial Session",
    "Hairstyle/Updo",
    "Complete Makeup",
    "Saree Draping",
    "Lashes (Strip)",
  ];
  List<String> brideItems = [
    "\$65 For 1.5 hours",
    "\$100 & up",
    "\$125 & up",
    "\$35 & up",
    "\$15",
  ];
  _bride() {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        primary: false,
        itemCount: bride.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              bride[index].toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }

  _brideItems() {
    return SizedBox(
      height: 230.0,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        primary: false,
        itemCount: brideItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              brideItems[index].toString(),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          );
        },
      ),
    );
  }

  // FOR HENNA
  List<String> heena = [
    "Group Events:",
    "\$80 per hour per artist (if the Bride confirms us to do her Henna)",
    "Or",
    "Bride:",
  ];
  List<String> heenaItems = [
    "\$100 per hour per artist",
    "\$7 & up per side of hand",
    "Arms and Feet \$150 & up (Consultation required for the pricing)",
  ];
  _heena() {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        primary: false,
        itemCount: heena.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              heena[index].toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }

  _heenaItems() {
    return SizedBox(
      height: 230.0,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        primary: false,
        itemCount: heenaItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              heenaItems[index].toString(),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          );
        },
      ),
    );
  }
}

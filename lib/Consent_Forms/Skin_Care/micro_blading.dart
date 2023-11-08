import 'package:bombaysign/termspage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MicroBlading extends StatefulWidget {
  @override
  _MicroBladingState createState() => _MicroBladingState();
}

class _MicroBladingState extends State<MicroBlading> {
  static var redColor = Color(0xFFAA0315);
  bool isTermsAgreed = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstController = TextEditingController();
  final _lastController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _zipController = TextEditingController();
  final _dateController = TextEditingController();

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
  String ?formatted, tms;
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
                'CLIENT CONSULTATION AND MEDICAL HEALTH FORM FOR MICROBLADING',
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
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator:   (val){
                                          validateZip(val!);
                                        },
                                        onSaved: ( val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 20.0, 11.0),
                                          hintText: "Name",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
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
                                          hintText: "Date-of-birth",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator:   (val){
                                          validateZip(val!);
                                        },
                                        onSaved: (  val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 20.0, 11.0),
                                          hintText: "Best Phone Contact",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator:   (val){
                                          validateZip(val!);
                                        },
                                        onSaved: (  val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 20.0, 11.0),
                                          hintText: "Address",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator:   (val){
                                          validateZip(val!);
                                        },
                                        onSaved: ( val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 20.0, 11.0),
                                          hintText: "Email Address",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator:   (val){
                                          validateZip(val!);
                                        },
                                        onSaved: (  val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 0.0, 11.0),
                                          hintText: "Age",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Theme(
                                    data: fieldTheme,
                                    child: TextFormField(
                                      validator:   (val){
                                        validateZip(val!);
                                      },
                                      onSaved: (  val) {
                                        //zipCode = val;
                                      },
                                      keyboardType: TextInputType.phone,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20.0),
                                      cursorColor: Colors.black87,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20.0, 11.0, 0.0, 11.0),
                                        hintText:
                                            "Any Medications taken in 6 months:",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Theme(
                                    data: fieldTheme,
                                    child: TextFormField(
                                      validator:   (val){
                                        validateZip(val!);
                                      },
                                      onSaved: (  val) {
                                        //zipCode = val;
                                      },
                                      keyboardType: TextInputType.phone,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20.0),
                                      cursorColor: Colors.black87,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20.0, 11.0, 0.0, 11.0),
                                        hintText:
                                            "Have you received chemotherapy / radiation in past year?",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Have you ever had an allergic reaction to any of the following (please tick):",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                        Row(
                          children: values.keys.map((String key) {
                            return Row(
                              children: [
                                Text(
                                  key,
                                ),
                                Checkbox(
                                  activeColor: redColor,
                                  checkColor: Colors.white,
                                  value: values[key],
                                  onChanged: (  value) {
                                    setState(() {
                                      values[key] = value!;
                                    });
                                  },
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 30.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Have you ever had a cold sore?",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: _radioValue1,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue1 = value!;
                                });
                              },
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 1,
                              groupValue: _radioValue1,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue1 = value!;
                                });
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "If yes, contact your physician for a preventative prescription capsule to prevent a cold sore",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Are you currently taking medication that thins the blood?",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: _radioValue2,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue2 = value!;
                                });
                              },
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 1,
                              groupValue: _radioValue2,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue2 = value!;
                                });
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "If yes, contact your physician for a preventative prescription capsule to prevent a cold sore",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Are you currently under the care of a physician?",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: _radioValue3,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue3 = value!;
                                });
                              },
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 1,
                              groupValue: _radioValue3,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue3 = value!;
                                });
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        _radioValue3 == 0
                            ? Theme(
                                data: fieldTheme,
                                child: TextFormField(
                                  validator:   (val){
                                    validateZip(val!);
                                  },
                                  onSaved: ( val) {
                                    //zipCode = val;
                                  },
                                  keyboardType: TextInputType.phone,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20.0),
                                  cursorColor: Colors.black87,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 11.0, 0.0, 11.0),
                                    hintText: "If yes please explain here",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              )
                            : Center(),
                        SizedBox(height: 10.0),
                        _radioValue3 == 0
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Physician’s Name :",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : SizedBox(height: 10.0),
                        _radioValue3 == 0
                            ? Theme(
                                data: fieldTheme,
                                child: TextFormField(
                                  validator:   (val){
                                    validateZip(val!);
                                  },
                                  onSaved: (  val) {
                                    //zipCode = val;
                                  },
                                  keyboardType: TextInputType.phone,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20.0),
                                  cursorColor: Colors.black87,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 11.0, 0.0, 11.0),
                                    hintText: "Enter Physician’s Name",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              )
                            : Center(),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Do you take antibiotics when going to the dentist?",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: _radioValue4,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue4 = value!;
                                });
                              },
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Radio(
                              value: 1,
                              groupValue: _radioValue4,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue4 = value!;
                                });
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        _radioValue4 == 0
                            ? Theme(
                                data: fieldTheme,
                                child: TextFormField(
                                  validator:   (val){
                                    validateZip(val!);
                                  },
                                  onSaved: (  val) {
                                    //zipCode = val;
                                  },
                                  keyboardType: TextInputType.phone,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20.0),
                                  cursorColor: Colors.black87,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 11.0, 0.0, 11.0),
                                    hintText: "If yes, why?",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              )
                            : Center(),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Have you ever had one of the following (please tick):",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: values1.keys.map((String key) {
                            return Row(
                              children: [
                                Text(
                                  key,
                                ),
                                Checkbox(
                                  activeColor: redColor,
                                  checkColor: Colors.white,
                                  value: values1[key],
                                  onChanged: (  value) {
                                    setState(() {
                                      values1[key] = value!;
                                    });
                                  },
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "What would you like to improve about your eyebrows?",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        FormField(
                          builder: (FormFieldState state) {
                            return InputDecorator(
                              decoration: InputDecoration(),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: _add,
                                  isDense: true,
                                  onChanged: ( newValue) {
                                    setState(() {
                                      _add = newValue!;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _address.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Please read the following statements carefully.",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Microblading is a way of cosmetic tattooing, intended to be semi permanent lasting average 12-18 months. On a rare occasion, the pigment may migrate under the skin. Procedure of microblading may be uncomfortable. Although extremely rare, there might be an immediate or delayed allergic reaction to pigment. A negative patch test result does not guarantee that you will not develop an allergic reaction after the full procedure. Allergic reactions to anesthetic can occur. ",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Permanent cosmetics cannot be performed if you are pregnant or nursing, or anyone under the age of 18. Infections can occur if aftercare instructions are not followed correctly. There may be swelling and redness following the procedure. You may experience minor bleeding. If you have an MRI scan within 3 months after microblading procedure, you should notify/discuss with your doctor. Possible scarring may occur.",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "I have received after care information and I’m fully aware of the aftercare procedures. I fully understand the information provided above & confirm that all information provided by me is correct and truthful.",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 10.0),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator:   (val){
                                          validateZip(val!);
                                        },
                                        onSaved: (  val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 20.0, 11.0),
                                          hintText: "Client Name",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
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
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator:   (val){
                                          validateZip(val!);
                                        },
                                        onSaved:  ( val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 20.0, 11.0),
                                          hintText: "Signature",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator:   (val){
                                          validateZip(val!);
                                        },
                                        onSaved: (  val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 20.0, 11.0),
                                          hintText: "Technician’s Name",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
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
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Flexible(
                                    child: Theme(
                                      data: fieldTheme,
                                      child: TextFormField(
                                        validator:   (val){
                                          validateZip(val!);
                                        },
                                        onSaved: (  val) {
                                          //zipCode = val;
                                        },
                                        keyboardType: TextInputType.phone,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                        cursorColor: Colors.black87,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 11.0, 20.0, 11.0),
                                          hintText: "Signature",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "For therapist use - Note pigments/blades used for this client",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Theme(
                          data: fieldTheme,
                          child: TextFormField(
                            validator:   (val){
                              validateZip(val!);
                            },
                            onSaved: (  val) {
                              //zipCode = val;
                            },
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                            cursorColor: Colors.black87,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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

  List<String> _address = [
    "Conside Shape",
    "Color",
    "Density",
    "Thickness",
    "Other"
  ];
  String _add = "Conside Shape";

  Map<String, bool> values = {
    'Latex': false,
    'Lanolin': false,
    'Vaseline': false,
    'Medication': false,
    'Metals': false,
    'Hair Dyes': false,
    'Foods': false,
    'Lidocaine': false,
    'Paints': false,
    'Crayons': false,
    'Glycerin': false,
  };
  Map<String, bool> values1 = {
    'Hair Loss': false,
    'Anemia': false,
    'Sensitivity to cosmetics': false,
    'Prolonged bleeding': false,
    'Diabetes': false,
    'Trichotillomania': false,
    'Epilepsy': false,
    'Artificial Heart Valve': false,
    'Low Blood pressure': false,
    'High Blood pressure': false,
    'Hemophilia': false,
    'HIV': false,
    'Fainting spells or dizziness': false,
    'Circulatory Problems': false,
    'Hypertrophic or keloid scars': false,
    'Liver Disease': false,
    'Alopecia': false,
    'Tumors, growths, cysts': false,
    'Thyroid disturbances Cancer': false,
    'Botox/filler injections': false,
    'Hepatitis': false,
    'Healing Problems': false,
    'Do you scar easily?': false,
    'Do you bruise/bleed easily?': false,
  };
  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });
    print(tmpArray);
    tmpArray.clear();
  }

  int? _radioValue1;
  int? _radioValue2;
  int? _radioValue3;
  int? _radioValue4;

  _checkList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: values.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key),
                value: values[key],
                activeColor: Colors.pink,
                checkColor: Colors.white,
                onChanged: (  value) {
                  setState(() {
                    values[key] = value!;
                  });
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  List<String> _agreement = [
    " including its artists, associates, apprentices, agents, or any employees (hereinafter referred to as the “Tattoo Studio” I agree to the following:",
    " understand that in rare occasions there are risks \nassociated with having artificial eyelashes \nand eyelash extensions applied to or removed from my \nnatural eyelashes. I further understand that in \nrare cases as part of the procedure eye irritation and discomfort could occur. \nI agree that if I experience any of these conditions \nwith my lashes that I will contact \nthe certified eyelash extension professional that performed \nthis procedure and it may be beneficial to have the eyelashes removed.",
    " understand and agree to the after-care instructions \nprovided by the certified eyelash extension \nprofessional for the use and care of my eyelash extensions.\nI realize and accept the consequences of \nfailure to adhere to these instructions may cause the eyelash \nextensions to fall out and/or decrease the time the lashes will last.",
    " understand and consent to having my eyes closed and \ncovered for the duration of approximately 60-120 minute procedure. \nTimes may vary depending on the type and number \nof eyelashes applied.",
    " I am informing the certified eyelash extension professional of the following conditions by marking with a check:"
  ];

  _buildAgreement() {
    return ListView(
      shrinkWrap: true,
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10.0),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "I acknowledge by signing this Release I have been given the full opportunity to ask any and all questions which I might have about obtaining a piercing from",
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.0),
            Container(
              width: 140.0,
              child: Theme(
                data: fieldTheme,
                child: TextFormField(
                  controller: _emailController,
                  validator:   (val){
                    validateZip(val!);
                  },
                  onSaved: (  val) {
                    //zipCode = val;
                  },
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "(hereinafter known as the “Piercer”) and all my questions have been answered to my full and total satisfaction. I acknowledge I have been advised of the matters set forth below and I agree as follows:",
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ],
    );
  }

  _buildBottomAgreement() {
    return ListView(
      shrinkWrap: true,
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10.0),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Therefore, I request the Piercer to pierce my ",
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.0),
            Container(
              width: 140.0,
              child: Theme(
                data: fieldTheme,
                child: TextFormField(
                  controller: _emailController,
                  validator:   (val){
                    validateZip(val!);
                  },
                  onSaved: (  val) {
                    //zipCode = val;
                  },
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'I understand this type of piercing usually takes ',
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: 140.0,
              child: Theme(
                data: fieldTheme,
                child: TextFormField(
                  controller: _emailController,
                  validator:   (val){
                    validateZip(val!);
                  },
                  onSaved: ( val) {
                    //zipCode = val;
                  },
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
            ),
            Text(
              "or longer to heal. I agree to release and forever discharge and hold harmless the Piercer and all employees from any and all claims, damages or legal actions arising from or connected in any way with my piercing, or the procedure and conduct used in my piercing.",
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ],
    );
  }
}

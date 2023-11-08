import 'package:bombaysign/termspage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BlackHeena extends StatefulWidget {
  @override
  _BlackHeenaState createState() => _BlackHeenaState();
}

class _BlackHeenaState extends State<BlackHeena> {
  static var redColor = Color(0xFFAA0315);
  bool isTermsAgreed = false;

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

  final _firstController = TextEditingController();

  final _dateController = TextEditingController();
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
                'BLACK HENNA Waiver & Permission Slip',
                style: TextStyle(
                    color: redColor, fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ), // 160
                      ListView(
                        shrinkWrap: true,
                        primary: false,
                        children: values.keys.map((String key) {
                          return CheckboxListTile(
                            title: Text(key),
                            value: values[key],
                            activeColor: redColor,
                            checkColor: Colors.white,
                            onChanged: (  value) {
                              setState(() {
                                values[key] = value!;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
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
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Flexible(
                            child: Theme(
                              data: fieldTheme,
                              child: TextFormField(
                                controller: _firstController,
                                validator:  (val){
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
                                  hintText: "Signature",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
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
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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

  Map<String, bool> values = {
    'I am 16 years of age or older. Anyone under the age of 16 years requires the signature of a parent or guardian.':
        false,
    'I understand that my Henna is a temporary stain and will fade within one month. Henna is not a tattoo. Henna is not permanent.':
        false,
    'I understand that this Henna may contain the black chemical P.P.D. (Paraphenylene Diamine).':
        false,
    'I am not to my knowledge allergic to any of these included ingredients.':
        false,
    'I do not have G6PD Deficiency. I have never been told by a doctor not to eat Broad Beans, Fava Beans, non-steroidal anti-inflammatory drugs, or Quinine.':
        false,
    'I hold Bombay Salon & Spa, the artist, and the Associates, harmless for any adverse reactions or effects of Henna.':
        false,
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
}

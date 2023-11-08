import 'package:bombaysign/homepage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentTab extends StatefulWidget {
  @override
  _AppointmentTabState createState() => _AppointmentTabState();
}

class _AppointmentTabState extends State<AppointmentTab> {
  PageController? _pageController;
  var isSelected = [true, false];
  var knowUsSelected = [true, false, false, false, false];

  static var redColor = Color(0xFFAA0315);
  bool isAppointment = false;
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  String _howKnow = 'friend';

  List<String> _address = [
    "3810 HACKCROSS RD, STE. 105, MEMPHIS, TN-38125",
    "1347 N.GERMANTOWN PKNY., CORDOVA, TN-38016",
    "2711 S.PERKINS RD., MEMPHIS, TN-38118",
    "7075 MALCO BLVD, STE. 111, SOUTHAVEN, MS-38671",
    "4692 SPOTTSWOOD AVE, MEMPHIS, TN-38117"
  ];
  String _add = "3810 HACKCROSS RD, STE. 105, MEMPHIS, TN-38125";

  var fieldTheme = ThemeData(
    primaryColor: redColor,
    hintColor: Colors.black87,
  );
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/b2.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: _appointmentForm(),
        ),
      ),
    );
  }

  Widget _appointmentForm() {
    return Container(
      height: 620,
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.2),
          blurRadius: 14.0,
          offset: Offset(6.0, 6.0),
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ), // 160
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
              'APPOINTMENT DETAILS',
              style: TextStyle(
                  color: redColor, fontSize: 24, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Appointment Selection :-',
                  style: TextStyle(fontSize: 22),
                ),
                ToggleButtons(
                  selectedColor: redColor,
                  fillColor: Color(0x33AA0315),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Walk In',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Appointment',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                  onPressed: (int i) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        if (buttonIndex == i) {
                          isAppointment = true;
                          isSelected[buttonIndex] = true;
                          print(isAppointment);
                        } else {
                          isAppointment = false;
                          isSelected[buttonIndex] = false;
                          print(isAppointment);
                        }
                      }
                    });
                  },
                  isSelected: isSelected,
                ),
              ],
            ),
            SizedBox(height: 20),
            isAppointment
                ? Row(
                    children: <Widget>[
                      Flexible(
                        child: Theme(
                          data: fieldTheme,
                          child: TextField(
                            controller: _dateController,
                            onTap: () => _selectDate(context),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 11.0, 10.0, 11.0),
                              hintText: "Select Date",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black)),
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
                            controller: _timeController,
                            onTap: () => _selectTime(context),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 11.0, 10.0, 11.0),
                              hintText: "Select Time",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Select Store :',
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 7.0,
            ),
            FormField(
              builder: (FormFieldState state) {
                return InputDecorator(
                  decoration: InputDecoration(),
                  isEmpty:
                      _add == "3810 HACKCROSS RD, STE. 105, MEMPHIS, TN-38125",
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _add,
                      isDense: true,
                      onChanged: (  newValue) {
                        setState(() {
                          _add = newValue!;
                          state.didChange(newValue);
                        });
                      },
                      items: _address.map(( value) {
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
            SizedBox(
              height: 20,
            ),
            Text(
              'How do you know us ?',
              style: TextStyle(fontSize: 22.0),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),
            ToggleButtons(
              selectedColor: redColor,
              fillColor: Color(0x33AA0315),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Friend',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Website',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Yelp',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Search',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Others',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
              onPressed: (int i) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < knowUsSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == i) {
                      setState(() {
                        switch (i) {
                          case 0:
                            _howKnow = 'Friend';
                            break;
                          case 1:
                            _howKnow = 'Website';
                            break;
                          case 2:
                            _howKnow = 'Yelp';
                            break;
                          case 3:
                            _howKnow = 'Search';
                            break;
                          case 4:
                            _howKnow = 'Others';
                            break;
                          default:
                            _howKnow = 'Friend';
                            break;
                        }
                      });
                      knowUsSelected[buttonIndex] = true;
                    } else {
                      knowUsSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: knowUsSelected,
            ),
            SizedBox(height: 25),
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
                    setState(() {
                      selectedTab = 0;
                    });
                    _pageController!.animateToPage(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                ),
                OutlinedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'NEXT',
                            style: TextStyle(color: redColor, fontSize: 22),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: redColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onPressed: () async {
                    print('store = $_add & howknow = $_howKnow');
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('store', _add);
                    prefs.setString('howknow', _howKnow);
                    prefs.setString('appointment', isAppointment.toString());
                    if (isAppointment) {
                      prefs.setString('date', _dateController.text);
                      prefs.setString('time', _timeController.text);
                    } else {
                      var thisDay = new DateTime.now();
                      var formatter = new DateFormat('yyyy-MM-dd');
                      var today = formatter.format(thisDay);
                      prefs.setString('date', today);
                      prefs.setString(
                          'time', '${thisDay.hour}:${thisDay.minute}:00');
                    }
                    setState(() {
                      selectedTab = 2;
                    });
                    _pageController!.animateToPage(2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
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

  Future<Null> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context,   child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        print(picked);
        TimeOfDay now = picked;
        var pp = '${now.hour}:${now.minute}:00';
        print(pp);
        tms = pp.toString();
        _timeController.text = tms!;
      });
  }
}

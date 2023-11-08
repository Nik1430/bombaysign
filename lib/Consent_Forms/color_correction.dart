import 'package:bombaysign/termspage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ColorCorrection extends StatefulWidget {
  @override
  _ColorCorrectionState createState() => _ColorCorrectionState();
}

class _ColorCorrectionState extends State<ColorCorrection> {
  static var redColor = Color(0xFFAA0315);
  bool isTermsAgreed = false;
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
                'Color correction -Client Consent Form',
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
                    ],
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

  Map<String, bool> values = {
    'Corrective hair color is a color process that must be performed by a professional hair colorist to correct any and all damage caused by a color service gone wrong.':
        false,
    'This could mean something as simple as you wanted to be honey blonde and ended up with platinum blonde hair or something as drastic as a chemical being left on your hair too long and now your hair is breaking off in your hair brush. Another reason you may need corrective color service is if you colored your hair at home and you turned your hair black instead of the warm brown shown on the box.':
        false,
    'There are many factors as to why a color service goes wrong. For those of you who do it at home, you may not realize that your hair is porous and will absorb more color than the average person. If your bad hair color was a result of a salon visit, you may have been working with someone inexperienced, which can lead to leaving bleach or color on your hair too long.':
        false,
    'Perhaps the most serious situation which can occur with an inexperienced hair colorist is that they fail to recognize that your hair is too damaged to color correctly in the first place and it needs deep conditioning and rehydration prior to being colored or bleached. All of these reasons and more are why you should always seek a true hair color experts.':
        false,
    'If you are coming in for a corrective color service HAIR HOLISTIC Salon, there are a few things that are important to be aware of before coming to the salon. When a client comes to us for corrective color services, she has usually had previous color services performed on her hair which have created an unsatisfactory result. If this is the case for you personally, it is important to realize the effect that these previous services may have had on your hair.':
        false,
    'Your hair is in a stressed and weakened condition when you walk through our door. Because of the caution necessary to perform services on fragile hair, it could take several visits to achieve the final result. That is why it is called “corrective hair color / Color correction".':
        false,
    'To set the correct expectations, it is important that you pay attention to your colorist advice and ask any questions that may arise during your initial consultation. Please keep in mind that the final result may take several visits to achieve, depending on how damaged or weak your hair is upon your first visit for color correction. This is due to the fact that performing all services necessary to correct the color for the desired result may break or further damage your hair if there is not ample time between processes to allow your hair to strengthen.':
        false,
    'Hair Color Correction will: Fix botched home hair color and other color disasters, Remove unwanted hues, Help restore your hair’s health, so you can get and keep the color you want, Make blonde less brassy, Create subtle tonal shifts, Lighten or darken your hair or just areas of it, such as ends or roots, Return your color to its natural shade.':
        false,
    'Please note that the number of visits cannot always be determined until the process is started. Additionally, there is not a set price for corrective color. The cost is determined by the amount of work necessary to achieve the desired result. Therefore, no refunds will be given after one salon visit if additional visits are needed to achieve the final desired result for corrective color.':
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

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends StatefulWidget {
  final String serviceName, serviceImage;
  final List<String> subServices;
  Services({required this.serviceName, required this.serviceImage, required this.subServices});

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  var appColor = Color(0xFFAA0315);
  List<String> _selectedServices = [];
  List<String> _filteredServices = [];
  List<bool> inputs = [];
  List<int> items = [];

  @override
  void initState() {
    super.initState();
    _showServices();
  }

  _clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  _showServices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      List<String> _allServices = prefs.getStringList('services') ?? [];
      for (var e in _allServices) {
        if (widget.subServices.contains(e)) {
          _filteredServices.add(e);
        }
      }
      print('all services $_allServices');
      print('filtered services $_filteredServices');
      items.clear();
      for (var j in _filteredServices) {
        var k = widget.subServices.indexOf(j);
        print("k is $k");
        if (k == widget.subServices.indexOf(j)) {
          items.add(k);
        }
      }
      print('items are $items');
      for (int i=0; i<widget.subServices.length; i++) {
        inputs.add(false);
      }
      if (items.isNotEmpty) {
        for (int i=0; i<widget.subServices.length; i++) {
          for (int j in items) {
            inputs[j] = true;
          }
        }
      }
    });
  }

  _itemChanged(bool val, int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedServices = prefs.getStringList('services') ?? [];
    setState(() {
      inputs[index] = val;
      if (inputs[index] == true) {
        _selectedServices.add(widget.subServices[index]);
      } else {
        _selectedServices.remove(widget.subServices[index]);
      }
      prefs.setStringList('services', _selectedServices);
      print('selected services are $_selectedServices');
      //    _showServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.6,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/bcover.jpg',),
                    fit: BoxFit.cover,),
                ),
              ),
              SizedBox(height: 20.0,),
              Text('${widget.serviceName} Services',
                style: TextStyle(fontSize: 32.0, color: appColor, fontWeight: FontWeight.w600),),
              SizedBox(height: 20.0,),
              Container(width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.black.withOpacity(.2), blurRadius: 14.0,
                      offset: Offset(6.0, 6.0),
                    )]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(tag: '${widget.serviceName}',
                      child: Image.asset('${widget.serviceImage}', fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width / 2.4,
                      ),
                    ),
                    Expanded(child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        child: ListView.builder(
                            itemCount: widget.subServices.length,
                            itemBuilder: (c, i) {
                              return Container(
                                child: CheckboxListTile(activeColor: appColor,
                                  value: inputs[i],
                                  title: Text(widget.subServices[i],
                                    style: TextStyle(fontSize: 20.0), maxLines: 2,),
                                  controlAffinity: ListTileControlAffinity.leading,
                                  onChanged: (  val) {
                                    _itemChanged(val!, i);
                                  },
                                ),
                              );
                            }),
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              Material(color: appColor,
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  minWidth: 400,
                  padding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 11.0),
                  child: Text("Add Services", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0).copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    print('register pressed');
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Positioned(top: 40, left: 25,
            child: FloatingActionButton(
              foregroundColor: Colors.black87,
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

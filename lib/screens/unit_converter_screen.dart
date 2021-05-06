import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testss/unit_converter/calculate.dart';
import 'package:testss/widgets/drawer.dart';

import '../constants.dart';

class UnitConverterScreen extends StatefulWidget {
  static const routeName = '/uc';
  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  String selected = 'Area';
  String dropdownValue1;
  String dropdownValue2;
  String siUnit1 = '';
  String siUnit2 = '';
  String number = '1';
  String number2 = '';

  @override
  void initState() {
    setInitialValue();
    calculate();
    super.initState();
  }

  getAnswer(String s) {
    setState(() {
      number2 = s;
    });
  }

  calculate() {
    if (double.tryParse(number) != null) {
      Calculate calculates = Calculate(
          unit: dropdownValue1,
          unit2: dropdownValue2,
          number1: double.parse(number),
          func: getAnswer);
      if (selected == 'Area')
        calculates.calculateArea();
      else if (selected == 'Length')
        calculates.calculateLength();
      else if (selected == 'Temperature')
        calculates.calculateTemperature();
      else if (selected == 'Volumes')
        calculates.calculateVolumes();
      else if (selected == 'Mass')
        calculates.calculateMass();
      else if (selected == 'Data')
        calculates.calculateData();
      else if (selected == 'speed')
        calculates.calculateSpeed();
      else
        calculates.calculateTime();
    } else
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid number')));
  }

  void setInitialValue() {
    setState(() {
      dropdownValue1 = selected == 'Area'
          ? Constants.areaItems[0]
          : selected == 'Length'
              ? Constants.lengthItems[0]
              : selected == 'Temperature'
                  ? Constants.temperatureItems[0]
                  : selected == 'Volumes'
                      ? Constants.volumeItems[0]
                      : selected == 'Mass'
                          ? Constants.massItems[0]
                          : selected == 'Data'
                              ? Constants.dataItems[0]
                              : selected == 'Speed'
                                  ? Constants.speedItems[0]
                                  : Constants.timeItems[0];
      dropdownValue2 = selected == 'Area'
          ? Constants.areaItems[1]
          : selected == 'Length'
              ? Constants.lengthItems[1]
              : selected == 'Temperature'
                  ? Constants.temperatureItems[1]
                  : selected == 'Volumes'
                      ? Constants.volumeItems[1]
                      : selected == 'Mass'
                          ? Constants.massItems[1]
                          : selected == 'Data'
                              ? Constants.dataItems[1]
                              : selected == 'Speed'
                                  ? Constants.speedItems[1]
                                  : Constants.timeItems[1];

      siUnit1 = dropdownValue1
          .split('(')[1]
          .substring(0, dropdownValue1.split('(')[1].length - 1);

      siUnit2 = dropdownValue2
          .split('(')[1]
          .substring(0, dropdownValue2.split('(')[1].length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Unit Converter'),
        ),
        drawer: MyDrawer(whatIsSelected: 'uc',),
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? portraitMode()
            : landscapeMode());
  }

  numberButton({String num = '', IconData icon}) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        if (num != '' && num != 'C') {
          setState(() {
            number += num;
          });
          calculate();
        } else if (num != '' && num == 'C') {
          setState(() {
            number = '';
          });
        } else if (num == '' && icon == Icons.backspace_outlined) {
          setState(() {
            number = number.substring(0, number.length - 1);
          });
          if (number != '') calculate();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.22,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade700),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: num.isNotEmpty
                ? Text(
                    num,
                    style: TextStyle(
                        color: num != 'C' && num != '+/-'
                            ? Colors.white
                            : num != '+/-'
                                ? Colors.orange
                                : Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                : Icon(
                    icon,
                    color: icon != Icons.arrow_upward &&
                            icon != Icons.arrow_downward
                        ? Colors.green
                        : Colors.grey,
                  ),
          ),
        ),
      ),
    ));
  }

  show(List<String> list) {
    bool isPotrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      height: isPotrait
          ? MediaQuery.of(context).size.height * 0.32
          : MediaQuery.of(context).size.width * 0.50,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 18.0, top: 5.0),
                    alignment: Alignment.topLeft,
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey.shade800,
                      value: dropdownValue1,
                      onChanged: (value) {
                        setState(() {
                          List<String> values = value.split('(');
                          dropdownValue1 = value;
                          siUnit1 =
                              values[1].substring(0, values[1].length - 1);
                          calculate();
                        });
                      },
                      items: list.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                item,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: isPotrait
                              ? MediaQuery.of(context).size.height * 0.03
                              : 5),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Center(
                            child: Container(
                              width: isPotrait
                                  ? MediaQuery.of(context).size.width * 0.90
                                  : MediaQuery.of(context).size.width * 0.35,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  number,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            siUnit1,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    //height: MediaQuery.of(context).size.height * 0.11,
                    padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                    alignment: Alignment.topLeft,
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey.shade800,
                      value: dropdownValue2,
                      onChanged: (value) {
                        setState(() {
                          List<String> values = value.split('(');
                          siUnit2 =
                              values[1].substring(0, values[1].length - 1);
                          dropdownValue2 = value;
                          calculate();
                        });
                      },
                      items: list.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                item,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: isPotrait
                              ? MediaQuery.of(context).size.height * 0.03
                              : 5),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Center(
                            child: Container(
                              width: isPotrait
                                  ? MediaQuery.of(context).size.width * 0.90
                                  : MediaQuery.of(context).size.width * 0.35,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  number2,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            siUnit2,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Divider(height: 5, color: Colors.grey,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  whatToShow() {
    return show(
      selected == 'Area'
          ? Constants.areaItems
          : selected == 'Length'
              ? Constants.lengthItems
              : selected == 'Temperature'
                  ? Constants.temperatureItems
                  : selected == 'Volumes'
                      ? Constants.volumeItems
                      : selected == 'Mass'
                          ? Constants.massItems
                          : selected == 'Data'
                              ? Constants.dataItems
                              : selected == 'Speed'
                                  ? Constants.speedItems
                                  : Constants.timeItems,
    );
  }

  landscapeMode() {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.10,
              child: showListview(),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: whatToShow()),
                VerticalDivider(
                  width: 8,
                  color: Colors.white,
                ),
                Expanded(child: showButton())
              ],
            ),
          )
        ],
      ),
    );
  }

  portraitMode() {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.10,
                child: showListview()),
          ),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          whatToShow(),
          Divider(
            height: 5,
            color: Colors.grey,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            child: showButton(),
          ),
        ],
      ),
    );
  }

  showButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Row(
            children: [
              numberButton(num: '7'),
              SizedBox(
                width: 5,
              ),
              numberButton(num: '8'),
              SizedBox(
                width: 5,
              ),
              numberButton(num: '9'),
              SizedBox(
                width: 5,
              ),
              numberButton(icon: Icons.backspace_outlined)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Row(
            children: [
              numberButton(num: '4'),
              SizedBox(
                width: 5,
              ),
              numberButton(num: '5'),
              SizedBox(
                width: 5,
              ),
              numberButton(num: '6'),
              SizedBox(
                width: 5,
              ),
              numberButton(num: 'C')
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Row(
            children: [
              numberButton(num: '1'),
              SizedBox(
                width: 5,
              ),
              numberButton(num: '2'),
              SizedBox(
                width: 5,
              ),
              numberButton(num: '3'),
              SizedBox(
                width: 5,
              ),
              numberButton(icon: Icons.arrow_upward)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Row(
            children: [
              numberButton(num: '+/-'),
              SizedBox(
                width: 5,
              ),
              numberButton(num: '0'),
              SizedBox(
                width: 5,
              ),
              numberButton(num: '.'),
              SizedBox(
                width: 5,
              ),
              numberButton(icon: Icons.arrow_downward)
            ],
          ),
        ),
      ],
    );
  }

  showListview() {
    return ListView.builder(
        itemCount: Constants.converter.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                  border: Border.all(
                      color: Colors.white,
                      style: Constants.converter[index] == selected
                          ? BorderStyle.solid
                          : BorderStyle.none)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = Constants.converter[index];
                      number = '1';
                      number2 = '';
                    });
                    setInitialValue();
                    calculate();
                  },
                  child: Text(
                    Constants.converter[index],
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )),
              ),
            ),
          );
        });
  }
}

import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;
import 'package:testss/save_to_db.dart';
import 'package:testss/screens/unit_converter_screen.dart';
import 'package:testss/widgets/drawer.dart';

class CalculatorScreen extends StatefulWidget {
  static const routeName = '/calculate';
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double answer = 0;
  bool isOperationPressed = false;
  String operations = '';
  bool isBracketOpen = false;
  bool isOperation = false;
  bool isOperationCommence = false;
  bool isSimpleAdvance = false;
  bool isEqualPressed = false;
  bool isShowHistory = false;
  bool isBracketOpenForOperation = false;
  List<Map<String, dynamic>> userHistory;
  SaveHistory saveHistory;

  showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void evaluate() {
    try {
      String valid = operations.replaceAll('x', '*');
      String valid2 = valid.replaceAll('÷', '/');
      String valid3 = valid2.replaceAll('√', 'sqrt');
      String valid4 = valid3.replaceAll('π', math.pi.toString());
      String valid5 = valid4.replaceAll('e', math.e.toString());
      Parser p = Parser();
      Expression exp = p.parse(valid5);
      ContextModel cm = ContextModel();
      setState(() {
        isOperationCommence = true;
        answer = exp.evaluate(EvaluationType.REAL, cm);
      });
    } catch (e) {
      if (e.toString().contains('Invalid')) {
        print('You forget to close the bracket');
      } else {
        showMessage('Syntax Error');
      }
    }
  }

  showHistory() {
    double potrait = MediaQuery.of(context).size.height * 0.38;
    double landscape = MediaQuery.of(context).size.width * 0.14;
    return Row(
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.40,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? potrait
                  : landscape,
              child: ListView.builder(
                itemCount: userHistory == null ? 0 : userHistory.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              operations += userHistory[index]['operation'];
                            });
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Text(
                                userHistory[index]['operation'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 3,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              operations += userHistory[index]['answer'];
                            });
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              '=${userHistory[index]['answer']}',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ]),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                saveHistory = new SaveHistory();
                saveHistory.clearDb();
                setState(() {
                  userHistory = [];
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: Text('Clear History',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  )),
            ),
          ],
        ),
      ],
    );
  }

  equal() async {
    evaluate();
    String answer1 = answer.toString().endsWith('.0')
        ? answer.toString().substring(0, answer.toString().length - 2)
        : answer.toString();
    try {
      saveHistory = new SaveHistory();
      saveHistory.insertData(operations, answer1);
      setState(() {
        userHistory = saveHistory.userHistory;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  number(String num) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (isEqualPressed && !isOperation) {
              operations = '';
            }
            if (isSimpleAdvance) {
              operations += isOperation ? '$num' : 'x$num';
              isSimpleAdvance = false;
              isOperationPressed = true;
              evaluate();
            } else if (isOperationPressed && !isBracketOpen) {
              operations += '$num';
              evaluate();
            } else {
              operations += '$num';
            }
            isOperation = false;
            isBracketOpenForOperation = false;
            isEqualPressed = false;
          });
        },
        child: Container(
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey.shade700),
          child: Center(
            child: Text(
              '$num',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }

  advanceOperation(String advop) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEqualPressed = false;
          operations += operations.isEmpty || isOperation
              ? '${advop != '|x|' ? advop : 'abs'}('
              : 'x${advop != '|x|' ? advop : 'abs'}(';
          isBracketOpen = true;
          isBracketOpenForOperation = true;
          isSimpleAdvance = false;
        });
      },
      child: Container(
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade700),
        child: Center(
          child: Text(
            '$advop',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  operatorFunc(String op) {
    setState(() {
      if (!isBracketOpenForOperation) {
        if (op == '-' || operations != '') {
          if (isOperation && op != '-' || operations.endsWith('-')) {
            if (operations.endsWith('x-') ||
                operations.endsWith('+-') ||
                operations.endsWith('÷-') ||
                operations.endsWith('--')) {
              operations = operations.substring(0, operations.length - 2);
              operations += op;
            } else {
              if (isOperation) {
                operations = operations.substring(0, operations.length - 1);
                operations += op;
              }
            }
          } else {
            if (operations.endsWith('++') ||
                operations.endsWith('xx') ||
                operations.endsWith('÷÷') ||
                operations.endsWith('+-') ||
                operations.endsWith('+x') ||
                operations.endsWith('+÷') ||
                operations.endsWith('-+') ||
                operations.endsWith('-x') ||
                operations.endsWith('-÷') ||
                operations.endsWith('x+') ||
                operations.endsWith('x÷') ||
                operations.endsWith('÷+') ||
                operations.endsWith('÷x')) {
              operations = operations.substring(0, operations.length - 2);
              operations += op;
            } else {
              if (!operations.endsWith('--')) operations += op;
            }
          }
          isOperation = true;
          isOperationPressed = true;
        }
      } else {
        if (op == '-') {
          operations += '-';
          isOperation = true;
          isOperationPressed = true;
          isBracketOpenForOperation = false;
        } else {
          showMessage('Invalid 2 Operation');
        }
      }
    });
  }

  operator(String op) {
    return GestureDetector(
        onTap: () {
          operatorFunc(op);
        },
        child: Container(
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey.shade700),
          child: Center(
            child: Text(
              '$op',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }

  operationPotrait(String op, [double width = 0]) {
    return GestureDetector(
      onTap: () {
        operatorFunc(op);
      },
      child: Container(
        width: width == 0 ? MediaQuery.of(context).size.width * 0.22 : width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade700),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              op,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  numberPotrait(String num) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isEqualPressed && !isOperation) {
            operations = '';
          }
          if (isSimpleAdvance) {
            operations += isOperation ? '$num' : 'x$num';
            isSimpleAdvance = false;
            isOperationPressed = true;
            evaluate();
          } else if (isOperationPressed && !isBracketOpen) {
            operations += '$num';
            evaluate();
          } else {
            operations += '$num';
          }
          isOperation = false;
          isBracketOpenForOperation = false;
          isEqualPressed = false;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.22,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.grey.shade700),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              num,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      drawer: MyDrawer(whatIsSelected: 'cal',),
      body: MediaQuery.of(context).orientation == Orientation.portrait
        ? potraitButton()
        : landscapeButtons(),
    );
  }

  potraitButton() {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.40,
              child: Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 8.0, left: 8.0),
                    child: SingleChildScrollView(
                        child: Cals(
                      text: operations,
                    )),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Cals(
                        text: !isOperationCommence
                            ? ''
                            : answer.toString() != 'NaN'
                                ? answer.toString().endsWith('.0')
                                    ? answer.toString().substring(
                                        0, answer.toString().length - 2)
                                    : answer.toString()
                                : 'Syntax Error',
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Icon(
                          !isShowHistory
                              ? Icons.schedule
                              : Icons.calculate_sharp,
                          color: !isShowHistory && userHistory == null
                              ? Colors.grey
                              : Colors.white,
                        ),
                        onTap: !isShowHistory && userHistory == null
                            ? () {}
                            : () {
                                setState(() {
                                  isShowHistory = !isShowHistory;
                                  saveHistory = new SaveHistory();
                                  userHistory = saveHistory.userHistory;
                                });
                              },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.rule,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, UnitConverterScreen.routeName);
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.calculate_outlined,
                          color: Colors.white,
                        ),
                        onTap: () {
                          AutoOrientation.landscapeAutoMode();
                        },
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (operations.isNotEmpty)
                              setState(() {
                                String removed =
                                    operations.substring(operations.length - 1);
                                if (removed == ')') {
                                  isBracketOpen = true;
                                }
                                operations = operations.substring(
                                    0, operations.length - 1);
                                if (!operations.endsWith('+') &&
                                    !operations.endsWith('-') &&
                                    !operations.endsWith('x') &&
                                    !operations.endsWith('÷') &&
                                    isOperationPressed &&
                                    removed != ')') evaluate();
                              });
                          },
                          child: Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.backspace_outlined,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 15,
                    color: Colors.white,
                  ),
                ],
              )),
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: !isShowHistory
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                operations = '';
                                isBracketOpen = false;
                                isOperation = false;
                                isOperationCommence = false;
                                isSimpleAdvance = false;
                                isOperationPressed = false;
                                answer = 0;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.17,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.grey.shade700),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'C',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                operations += operations.isEmpty || isOperation
                                    ? '('
                                    : 'x(';
                                isEqualPressed = false;
                                isBracketOpenForOperation = true;
                                isBracketOpen = true;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.17,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.grey.shade700),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    '(',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (!isEqualPressed && isBracketOpen) {
                                  operations += ')';
                                  isBracketOpen = false;
                                  isBracketOpenForOperation = false;
                                  isSimpleAdvance = false;
                                  evaluate();
                                } else {
                                  showMessage('Invalid Operation');
                                }
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.17,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.grey.shade700),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    ')',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                operations += operations.isEmpty
                                    ? showMessage('Invalid Operation')
                                    : '/100';
                                isSimpleAdvance = true;
                                evaluate();
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.17,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.grey.shade700),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    '%',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          operationPotrait(
                              '÷', MediaQuery.of(context).size.width * 0.17),
                        ],
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          numberPotrait('7'),
                          numberPotrait('8'),
                          numberPotrait('9'),
                          operationPotrait('x')
                        ],
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          numberPotrait('4'),
                          numberPotrait('5'),
                          numberPotrait('6'),
                          operationPotrait('-')
                        ],
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          numberPotrait('1'),
                          numberPotrait('2'),
                          numberPotrait('3'),
                          operationPotrait('+')
                        ],
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.22,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.grey.shade700),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '+/-',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          numberPotrait('0'),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isOperation = false;
                                List<String> operation =
                                    operations.split(RegExp(r"x|\+|-|÷"));
                                if (!operation[operation.length - 1]
                                    .contains('.'))
                                  operations +=
                                      operations.isNotEmpty ? '.' : '0.';
                                else
                                  showMessage('Invalid Operation');
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.grey.shade700),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    '.',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: equal,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.green),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    '=',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ],
                  )
                : showHistory(),
          )
        ],
      ),
    );
  }

  landscapeButtons() {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.15,
              child: Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Cals(
                      text: operations,
                    ),
                  ))),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: Cals(
                        text: !isOperationCommence
                            ? ''
                            : answer.toString() != 'NaN'
                                ? answer.toString().endsWith('.0')
                                    ? answer.toString().substring(
                                        0, answer.toString().length - 2)
                                    : answer.toString()
                                : 'Syntax Error',
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Icon(
                          !isShowHistory
                              ? Icons.schedule
                              : Icons.class__outlined,
                          color: !isShowHistory && userHistory == null
                              ? Colors.grey
                              : Colors.white,
                        ),
                        onTap: !isShowHistory && userHistory == null
                            ? () {}
                            : () {
                                setState(() {
                                  isShowHistory = !isShowHistory;
                                  saveHistory = SaveHistory();
                                  userHistory = SaveHistory().userHistory;
                                });
                              },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.rule,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, UnitConverterScreen.routeName);
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.calculate_outlined,
                          color: Colors.white,
                        ),
                        onTap: () {
                          AutoOrientation.portraitUpMode();
                        },
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (operations.isNotEmpty)
                              setState(() {
                                String removed =
                                    operations.substring(operations.length - 1);
                                if (removed == ')') {
                                  isBracketOpen = true;
                                }
                                operations = operations.substring(
                                    0, operations.length - 1);
                                if (!operations.endsWith('+') &&
                                    !operations.endsWith('-') &&
                                    !operations.endsWith('x') &&
                                    !operations.endsWith('÷') &&
                                    isOperationPressed &&
                                    removed != ')') evaluate();
                              });
                          },
                          child: Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.backspace_outlined,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    height: 5,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    !isShowHistory
                        ? Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Colors.grey.shade700),
                                        child: Center(
                                          child: Text(
                                            '<-',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            operations += operations.isEmpty
                                                ? '√('
                                                : 'x√(';
                                            isBracketOpen = true;
                                          });
                                        },
                                        child: Container(
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.grey.shade700),
                                          child: Center(
                                            child: Text(
                                              '√',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            operations = '';
                                            isBracketOpen = false;
                                            isOperation = false;
                                            isOperationCommence = false;
                                            isSimpleAdvance = false;
                                            isOperationPressed = false;
                                            answer = 0;
                                          });
                                        },
                                        child: Container(
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.grey.shade700),
                                          child: Center(
                                            child: Text(
                                              'C',
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      advanceOperation('sin'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      advanceOperation('cos'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      advanceOperation('tan'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      advanceOperation('ln'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      advanceOperation('log'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            operations += operations.isEmpty ||
                                                    isOperation
                                                ? '1÷'
                                                : 'x1÷';
                                            isOperation = true;
                                            isOperationPressed = true;
                                          });
                                        },
                                        child: Container(
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.grey.shade700),
                                          child: Center(
                                            child: Text(
                                              '1/x',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            operations += operations.isEmpty
                                                ? 'e^('
                                                : 'xe^(';
                                            isBracketOpen = true;
                                          });
                                        },
                                        child: Container(
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.grey.shade700),
                                          child: Center(
                                            child: Text(
                                              'eˣ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            operations += operations.isEmpty
                                                ? showMessage(
                                                    'Invalid Format used')
                                                : '^(2)';
                                            evaluate();
                                          });
                                        },
                                        child: Container(
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.grey.shade700),
                                          child: Center(
                                            child: Text(
                                              'x²',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            operations += operations.isEmpty
                                                ? showMessage(
                                                    'Invalid Format used')
                                                : '^(';
                                            isBracketOpen = true;
                                          });
                                        },
                                        child: Container(
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.grey.shade700),
                                          child: Center(
                                            child: Text(
                                              'xʸ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      advanceOperation('|x|'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            operations +=
                                                operations.isEmpty ? 'π' : 'xπ';
                                            isBracketOpen = true;
                                          });
                                        },
                                        child: Container(
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.grey.shade700),
                                          child: Center(
                                            child: Text(
                                              'π',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            operations += operations.isNotEmpty
                                                ? 'xe'
                                                : 'e';
                                            isSimpleAdvance = true;
                                          });
                                        },
                                        child: Container(
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.grey.shade700),
                                          child: Center(
                                            child: Text(
                                              'e',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : showHistory(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: VerticalDivider(
                        width: 15,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    operations +=
                                        operations.isEmpty || isOperation
                                            ? '('
                                            : 'x(';
                                    isEqualPressed = false;
                                    isBracketOpen = true;
                                  });
                                },
                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.grey.shade700),
                                  child: Center(
                                    child: Text(
                                      '(',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (!isEqualPressed && isBracketOpen) {
                                      operations += ')';
                                      isBracketOpen = false;
                                      isSimpleAdvance = false;
                                      evaluate();
                                    } else {
                                      showMessage('Invalid Operation');
                                    }
                                  });
                                },
                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.grey.shade700),
                                  child: Center(
                                    child: Text(
                                      ')',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    operations += operations.isEmpty
                                        ? showMessage('Invalid Operation')
                                        : '/100';
                                    isSimpleAdvance = true;
                                    evaluate();
                                  });
                                },
                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.grey.shade700),
                                  child: Center(
                                    child: Text(
                                      '%',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              operator('÷'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              number('7'),
                              number('8'),
                              number('9'),
                              operator('x'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              number('4'),
                              number('5'),
                              number('6'),
                              operator('-'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              number('1'),
                              number('2'),
                              number('3'),
                              operator('+'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.grey.shade700),
                                  child: Center(
                                    child: Text(
                                      '+/-',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              number('0'),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isOperation = false;
                                    List<String> operation =
                                        operations.split(RegExp(r"x|\+|-|÷"));
                                    if (!operation[operation.length - 1]
                                        .contains('.'))
                                      operations +=
                                          operations.isNotEmpty ? '.' : '0.';
                                    else
                                      showMessage('Invalid Operation');
                                  });
                                },
                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.grey.shade700),
                                  child: Center(
                                    child: Text(
                                      '.',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: equal,
                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.green),
                                  child: Center(
                                    child: Text(
                                      '=',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Cals extends StatelessWidget {
  final String text;
  const Cals({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.right,
            //textDirection: TextDirection.rtl,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}

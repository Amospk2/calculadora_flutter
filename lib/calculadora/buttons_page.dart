import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  State<ButtonPage> createState() => _ButtonPageSate();
}

class _ButtonPageSate extends State<ButtonPage> {
  String _PanelContent =
      "565656595959595959594494949494949494949496446464665656546555556666666656565654644949494";

  void setPanelContent(String content) {
    if (_PanelContent == '0.0' || _PanelContent == '0') {
      setState(() {
        _PanelContent = content;
      });
    } else if (_PanelContent.length < 63) {
      setState(() {
        _PanelContent += content;
      });
    }
  }

  void remove(int op) {
    if (op == 1) {
      setState(() {
        _PanelContent = _PanelContent.substring(0, _PanelContent.length - 1);
      });
    } else {
      setState(() {
        _PanelContent = '';
      });
    }
  }

  void setResult() {
    var result = 0.0, lastSign = 0;

    if (!(_PanelContent.contains('+') ||
        _PanelContent.contains('-') ||
        _PanelContent.contains('*') ||
        _PanelContent.contains('/'))) {
      result = double.parse(_PanelContent);
    } else {
      for (int i = 0; i < _PanelContent.length; i++) {
        if (_PanelContent[i] == '+' ||
            _PanelContent[i] == '-' ||
            _PanelContent[i] == '*' ||
            _PanelContent[i] == '/') {
          if (lastSign != 0) {
            if (_PanelContent[lastSign] == '-') {
              result -= double.parse(_PanelContent.substring(lastSign + 1, i));
            } else if (_PanelContent[lastSign] == '+') {
              result += double.parse(_PanelContent.substring(lastSign + 1, i));
            } else if (_PanelContent[lastSign] == '*') {
              if (result == 0) {
                result = double.parse(_PanelContent.substring(lastSign + 1, i));
              } else {
                result *=
                    double.parse(_PanelContent.substring(lastSign + 1, i));
              }
            } else if (_PanelContent[lastSign] == '/') {
              if (double.parse(_PanelContent.substring(lastSign + 1, i)) == 0) {
                setState(() {
                  _PanelContent = result.toString();
                });
              } else {
                result /=
                    double.parse(_PanelContent.substring(lastSign + 1, i));
              }
            }
          } else {
            result = double.parse(_PanelContent.substring(lastSign, i));
          }

          lastSign = i;
        }
      }

      if (_PanelContent[lastSign] == '-') {
        result -= double.parse(
            _PanelContent.substring(lastSign + 1, _PanelContent.length));
      } else if (_PanelContent[lastSign] == '+') {
        result += double.parse(
            _PanelContent.substring(lastSign + 1, _PanelContent.length));
      } else if (_PanelContent[lastSign] == '*') {
        if (result == 0) {
          result = double.parse(
              _PanelContent.substring(lastSign + 1, _PanelContent.length));
        } else {
          result *= double.parse(
              _PanelContent.substring(lastSign + 1, _PanelContent.length));
        }
      } else if (_PanelContent[lastSign] == '/') {
        if (double.parse(
                _PanelContent.substring(lastSign + 1, _PanelContent.length)) ==
            0) {
          setState(() {
            _PanelContent = result.toString();
          });
        } else {
          result /= double.parse(
              _PanelContent.substring(lastSign + 1, _PanelContent.length));
        }
      }
    }

    setState(() {
      _PanelContent = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Text(
              _PanelContent,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Container(
            height: (7 * MediaQuery.of(context).size.height) / 100,
            width: (27 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                remove(1);
              },
              onLongPress: () {
                setState(() {
                  _PanelContent = '';
                });
              },
              child: const Text("clear"),
            ),
          ),
          Container(
            height: (7 * MediaQuery.of(context).size.height) / 100,
            width: (27 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                remove(2);
              },
              child: const Text("clearAll"),
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (27 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("1");
              },
              child: const Text("1"),
            ),
          ),
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (27 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("2");
              },
              child: const Text("2"),
            ),
          ),
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (27 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("3");
              },
              child: const Text("3"),
            ),
          ),
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (19 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("+");
              },
              child: const Text("+"),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (27 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("4");
              },
              child: const Text("4"),
            ),
          ),
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (27 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("5");
              },
              child: const Text("5"),
            ),
          ),
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (27 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("6");
              },
              child: const Text("6"),
            ),
          ),
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (19 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("-");
              },
              child: const Text("-"),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (27 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("7");
              },
              child: const Text("7"),
            ),
          ),
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (27 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("8");
              },
              child: const Text("8"),
            ),
          ),
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (27 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("9");
              },
              child: const Text("9"),
            ),
          ),
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (19 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("*");
              },
              child: const Text("*"),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (27 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("0");
              },
              child: const Text("0"),
            ),
          ),
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (54 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setResult();
              },
              child: const Text("="),
            ),
          ),
          Container(
            height: (14.5 * MediaQuery.of(context).size.height) / 100,
            width: (19 * MediaQuery.of(context).size.width) / 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 61, 168, 255)),
              onPressed: () {
                setPanelContent("/");
              },
              child: const Text("/"),
            ),
          ),
        ],
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ErrorDialogWidget extends StatefulWidget {
  final String error;
  const ErrorDialogWidget({Key? key, required this.error}) : super(key: key);

  @override
  _ErrorDialogWidgetState createState() => _ErrorDialogWidgetState();
}

class _ErrorDialogWidgetState extends State<ErrorDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      content: Observer(
        builder: (_) => SingleChildScrollView(
          child: Form(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 24,
                      width: 24,
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 20,
                      ),
                      // decoration: BoxDecoration(
                      //   shape: BoxShape.circle,
                      //   color: ColorLib.colorPrimary.colorO(1),
                      // ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Icon(
                    Icons.warning,
                    size: 50,
                    color: Colors.red[800],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Algo deu errado!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Montserrat',
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  child: Text(
                    widget.error,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Montserrat',
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      // Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red[800]!),
                    ),
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

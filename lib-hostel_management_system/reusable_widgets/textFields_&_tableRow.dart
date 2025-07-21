import 'package:flutter/material.dart';

buildTextField(controllerArg, String labelTextArg, {bool isKbNumber = false}) {
  // var dimVar = MediaQuery.of(context).size;
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.center,

      children: [
        //******First text Field from here *****
        TextFormField(
          controller: controllerArg,
          keyboardType:
              isKbNumber ? TextInputType.number : TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: labelTextArg, //hint text here
          ),
        ),
        SizedBox(
          height: 20,
          //height : dimVar.height*0.04
        ),
      ],
    ),
  );
}

createTableRow(col1DataArg, col2DataArg) {
  //! note this should be inside a table widget
  return TableRow(
      // decoration: BoxDecoration(color: Colors.blue),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            col1DataArg,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            col2DataArg,
            textAlign: TextAlign.center,
          ),
        ),
      ]);
}

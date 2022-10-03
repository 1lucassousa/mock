import 'package:flutter/material.dart';

class Justificativa extends StatefulWidget {
  const Justificativa({Key key}) : super(key: key);

  @override
  State<Justificativa> createState() => _JustificativaState();
}

class _JustificativaState extends State<Justificativa> {
  final textFormFieldController = TextEditingController();

  String dataChoose;
  List<String> dias = ['03/10', '04/10', '05/10', '06/10', '07/10'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Justificativa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            buildContainerDropDownButtonDiaJustificar(),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: textFormFieldController,
                  minLines: 2,
                  maxLines: 8,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      child: const Icon(
                        Icons.cancel,
                        color: Color(0xFF15325b),
                      ),
                      onTap: () {
                        textFormFieldController.clear();
                      },
                    ),
                    hintText: 'Justifique aqui!',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF15325b),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF15325b),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildButton(context)
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildContainerDropDownButtonDiaJustificar() {
    return SizedBox(
      height: 59,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          labelText: "Dia",
        ),
        dropdownColor: Colors.white,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 16,
        isExpanded: true,
        style: const TextStyle(
          color: Colors.black,
        ),
        value: dataChoose,
        onChanged: (newValue) async {
          setState(() {
            dataChoose = newValue;
          });
        },
        items: dias.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      ),
    );
  }

  SizedBox buildButton(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF15325b),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        child: const Text('Salvar Justificativa'),
        onPressed: () async {
          _alertaSucesso(
            context,
          );
        },
      ),
    );
  }

  _alertaSucesso(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Justificativa"),
          content: const Text('Deseja salvar sua justificativa?'),
          actions: <Widget>[
            TextButton(
              child: const Text("Não"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Sim"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}

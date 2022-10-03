import 'package:flutter/material.dart';

class Visita extends StatefulWidget {
  const Visita({Key key}) : super(key: key);

  @override
  State<Visita> createState() => _VisitaState();
}

class _VisitaState extends State<Visita> {
  List<String> listaUnidades = ['Unidade 1', 'Unidade 2', 'Unidade 3'];
  List<String> modalidade = ['Diretor', 'Custodiado'];
  List<String> dias = ['03/10', '04/10', '05/10', '06/10', '07/10'];
  List<String> hora = [
    '08:00 -- 08:30',
    '08:30 -- 09:00',
    '09:00 -- 09:30',
    '09:30 -- 10:00',
    '10:30 -- 11:00',
    '11:00 -- 11:30'
  ];

  final _ctrlNome = TextEditingController();

  String unidadeChoose;
  String modalidadeChoose;
  String dataChoose;
  String horaChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamento Visita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            buildContainerDropDownButtonTipoAtendimento(),
            modalidadeChoose == null
                ? const SizedBox()
                : (modalidadeChoose != 'Custodiado')
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          buildContainerDropDownButtonUnidade(),
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          _textFormFieldNome('Nome completo',
                              controller: _ctrlNome),
                        ],
                      ),
            const SizedBox(
              height: 10,
            ),
            (modalidade == null)
                ? const SizedBox()
                : buildContainerDropDownButtonDias(),
            const SizedBox(
              height: 10,
            ),
            (modalidade == null)
                ? const SizedBox()
                : buildContainerDropDownButtonHora(),
            const SizedBox(
              height: 20,
            ),
            buildButton(context)
          ],
        ),
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
        child: const Text('Salvar Solicitação'),
        onPressed: () async {
          _alertaSucesso(context, 'Visita solicitada com sucesso');
        },
      ),
    );
  }

  SizedBox buildContainerDropDownButtonUnidade() {
    return SizedBox(
      height: 59,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          labelText: "Unidade",
        ),
        dropdownColor: Colors.white,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 16,
        isExpanded: true,
        style: const TextStyle(
          color: Colors.black,
        ),
        value: unidadeChoose,
        onChanged: (newValue) async {
          setState(() {
            unidadeChoose = newValue;
          });
        },
        items: listaUnidades.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      ),
    );
  }

  SizedBox buildContainerDropDownButtonTipoAtendimento() {
    return SizedBox(
      height: 59,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          labelText: "Tipo Atendimento",
        ),
        dropdownColor: Colors.white,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 16,
        isExpanded: true,
        style: const TextStyle(
          color: Colors.black,
        ),
        value: modalidadeChoose,
        onChanged: (newValue) async {
          setState(() {
            modalidadeChoose = newValue;
          });
        },
        items: modalidade.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      ),
    );
  }

  _textFormFieldNome(
    String label, {
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () async {
              _internos(context);
            },
            icon: const Icon(Icons.search)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        labelText: label,
      ),
    );
  }

  SizedBox buildContainerDropDownButtonDias() {
    return SizedBox(
      height: 59,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          labelText: "Data",
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

  SizedBox buildContainerDropDownButtonHora() {
    return SizedBox(
      height: 59,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          labelText: "Hora",
        ),
        dropdownColor: Colors.white,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 16,
        isExpanded: true,
        style: const TextStyle(
          color: Colors.black,
        ),
        value: horaChoose,
        onChanged: (newValue) async {
          setState(() {
            horaChoose = newValue;
          });
        },
        items: hora.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      ),
    );
  }

  _alertaSucesso(BuildContext context, String msg) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Solicitação de Visita"),
          content: Text(msg),
          actions: <Widget>[
            TextButton(
              child: const Text("Ok"),
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

  _internos(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Internos'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  title: const Text('NOME INTERNO 1'),
                  subtitle: const Text('NOME DA MÃE'),
                  trailing: const Text('UPSL 1'),
                  onTap: () {
                    _ctrlNome.text = 'NOME INTERNO 1';
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('NOME INTERNO 2'),
                  subtitle: const Text('NOME DA MÃE'),
                  trailing: const Text('UPSL 2'),
                  onTap: () {
                    _ctrlNome.text = 'NOME INTERNO 2';
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('NOME INTERNO 3'),
                  subtitle: const Text('NOME DA MÃE'),
                  trailing: const Text('UPSL 3'),
                  onTap: () {
                    _ctrlNome.text = 'NOME INTERNO 3';
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('NOME INTERNO 4'),
                  subtitle: const Text('NOME DA MÃE'),
                  trailing: const Text('UPSL 4'),
                  onTap: () {
                    _ctrlNome.text = 'NOME INTERNO 4';
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

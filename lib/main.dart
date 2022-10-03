import 'package:flutter/material.dart';
import 'package:mock/justificativa.dart';
import 'package:mock/visita.dart';
import 'package:mock/visitas_solicitadas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xFF15325b)),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15325b),
      appBar: AppBar(
        title: const Text(''),
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Mock'),
              accountEmail: null,
              decoration: const BoxDecoration(
                color: Color(0xFF15325b),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Image.asset(
                  "assets/user.png",
                  /* color: const Color(0xFF15325b), */ fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: const Text("Sair"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 80, right: 80),
        child: ListView(
          children: [
            buildSizedBoxBrasaoIcon(),
            const SizedBox(
              height: 80,
            ),
            buildContainerSolicitarVisitaPresencial(context),
            const SizedBox(
              height: 20,
            ),
            buildContainerSolicitarVisitasSolicitadas(context),
            const SizedBox(
              height: 20,
            ),
            buildContainerJustificativa(context),
            const SizedBox(
              height: 35,
            ),
            buildSizedBoxLogoFooter()
          ],
        ),
      ),
    );
  }

  Container buildContainerSolicitarVisitaPresencial(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox.expand(
        child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Solicitar Visita",
                // textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF15325b),
                  fontSize: 15,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 4),
                child: const SizedBox(
                  child: Icon(
                    Icons.confirmation_num,
                    color: Color(0xFF15325b),
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Visita()));
          },
        ),
      ),
    );
  }

  Container buildContainerSolicitarVisitasSolicitadas(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox.expand(
        child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Visitas Solicitadas",
                // textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF15325b),
                  fontSize: 15,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 4),
                child: const SizedBox(
                  child: Icon(
                    Icons.person,
                    color: Color(0xFF15325b),
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VisitasSolicitadas()));
          },
        ),
      ),
    );
  }

  Container buildContainerJustificativa(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox.expand(
        child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Justificativa",
                // textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF15325b),
                  fontSize: 15,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 4),
                child: const SizedBox(
                  child: Icon(
                    Icons.done,
                    color: Color(0xFF15325b),
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Justificativa()));
          },
        ),
      ),
    );
  }

  SizedBox buildSizedBoxBrasaoIcon() {
    return SizedBox(
      height: 180,
      child: Image.asset("assets/logo_seap_online.png"),
    );
  }

  SizedBox buildSizedBoxLogoFooter() {
    return SizedBox(
      height: 190,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Image.asset("assets/logo-governo.png"),
      ),
    );
  }
}

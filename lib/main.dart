import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final MaterialColor materialWhite = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: materialWhite,
          primarySwatch: Colors.blue),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: '割り勘最強！！'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double nenpi = 0;
  double gas = 0;
  double distance = 0;
  int road = 0;
  int other = 0;
  int gasSum = 0;
  int costSum = 0;
  int? peopleNum = 1;
  int costOne = 0;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CalculationFuel(),
            display(costSum),
            people(),
          ],
        ),
      ),
    );
  }

  Widget CalculationFuel() {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
      width: screenSize.width * 1,
      //height: screenSize.height * 0.27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 219, 219, 218),
      ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSize.width*0.35,
                    child: TextField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.drive_eta, color: Colors.black,),
                        labelText: "燃費",
                        hintText: "16.3",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                      ),
                      onChanged: (text) {
                        nenpi = double.parse(text);
                      },
                    ),
                  ),
                  const Text(
                    "Km/L",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSize.width*0.35,
                    child: TextField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.ev_station, color: Colors.black,),
                        labelText: "ガソリン代",
                        hintText: "155",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                      ),
                      onChanged: (text) {
                        gas = double.parse(text);
                      },
                    ),
                  ),
                  const Text(
                    "円",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSize.width*0.35,
                    child: TextField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.directions_run, color: Colors.black,),
                        labelText: "走行距離",
                        hintText: "25",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                      ),
                      onChanged: (text) {
                        distance = double.parse(text);
                      },
                    ),
                  ),
                  const Text(
                    "Km",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width*0.35,
                    child: TextField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.signpost, color: Colors.black,),
                        labelText: "高速道路",
                        hintText: "2500",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                      ),
                      onChanged: (text) {
                        road = int.parse(text);
                      },
                    ),
                  ),
                  const Text(
                    "円",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenSize.width*0.35,
                    child: TextField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.outlet_sharp, color: Colors.black,),
                        labelText: "その他",
                        hintText: "500",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                      ),
                      onChanged: (text) {
                        other = int.parse(text);
                      },
                    ),
                  ),
                  const Text(
                    "円",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget display(int sum) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 1,
      //height: screenSize.height * 0.2,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 219, 219, 218),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () {
              setState(() {
                calc(gas, nenpi, distance, road, other);
              });
            },
            child: const Text("計算する"),
          ),
          Column(
            children: [
              const Text("合計金額は"),
              Text(
                "$sum円！",
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget people() {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 1,
      //height: screenSize.height * 0.2,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 219, 219, 218),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          Column(
            children: [
              const Text(
            "人数",
            style: TextStyle(fontSize: 20),
          ),
              DecoratedBox(
                decoration:  BoxDecoration(
                  color: const Color.fromARGB(255, 32, 31, 31),
                  border: Border.all(color: Colors.black38, width:3),
                  borderRadius: BorderRadius.circular(50), // 
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:30, right: 30),
                  child: DropdownButton(
                    value: peopleNum,
                    items: const [
                      DropdownMenuItem(value: 1, child: Text('1人')),
                      DropdownMenuItem(value: 2, child: Text('2人')),
                      DropdownMenuItem(value: 3, child: Text('3人')),
                      DropdownMenuItem(value: 4, child: Text('4人')),
                      DropdownMenuItem(value: 5, child: Text('5人')),
                      DropdownMenuItem(value: 6, child: Text('6人')),
                      DropdownMenuItem(value: 7, child: Text('7人')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        peopleNum = value;
                        costOne = calcOne(peopleNum, costSum);
                      });
                    },
              //       isExpanded: true,
              //       underline: Container(),
                     style: TextStyle(fontSize: 18, color: Colors.white),
               dropdownColor: Colors.black,
               iconEnabledColor: Colors.white, 
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 80,
          ),
          Column(
            children: [
              const Text("一人あたり"),
              Text(
                "$costOne円！",
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int calc(double gas, double nenpi, double distance, int road, int other) {
    gasSum = ((gas / nenpi) * distance).round();
    costSum = gasSum + road + other;
    return costSum;
  }

  int calcOne(int? people, int sum) {
    if (people != null) {
      return (sum / people).round();
    } else {
      return 0;
    }
  }
}

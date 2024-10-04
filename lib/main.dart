import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WC Update App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MatchListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MatchListScreen extends StatefulWidget {
  @override
  _MatchListScreenState createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40), // For status bar padding
              Text('Welcome,', style: TextStyle(fontSize: 16)),
              Text('Mulyono Siregar!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Find your National Team',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),
              Text('Live Match',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('World Cup',
                              style: TextStyle(fontSize: 16)),
                          Text("80'",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/france.png', height: 40),
                          SizedBox(width: 20),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                              children: [
                                TextSpan(
                                    text: '3',
                                    style: TextStyle(color: Colors.green)),
                                TextSpan(text: ' : '),
                                TextSpan(text: '0'),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Image.asset('assets/images/japan.png', height: 40),
                        ],
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LiveScoreScreen()),
                          );
                        },
                        child: Text('LIVE'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Finished Match',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FinishedMatchCard(
                      league: 'World Cup',
                      date: 'Yesterday',
                      team1Logo: 'assets/images/brazil.png',
                      team2Logo: 'assets/images/indonesia.png',
                      score: '7 : 7',
                    ),
                    SizedBox(width: 10),
                    FinishedMatchCard(
                      league: 'World Cup',
                      date: 'Yesterday',
                      team1Logo: 'assets/images/argentina.png',
                      team2Logo: 'assets/images/england.png',
                      score: '5 : 2',
                    ),
                    // Add more cards here if needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class FinishedMatchCard extends StatelessWidget {
  final String league;
  final String date;
  final String team1Logo;
  final String team2Logo;
  final String score;

  const FinishedMatchCard({
    Key? key,
    required this.league,
    required this.date,
    required this.team1Logo,
    required this.team2Logo,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> scores = score.split(' : ');
    int team1Score = int.parse(scores[0]);
    int team2Score = int.parse(scores[1]);

    return SizedBox(
      width: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the start
            children: [
              Text(league, style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              Text(date, style: TextStyle(fontSize: 14, color: Colors.grey)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(team1Logo, height: 40),
                  SizedBox(width: 20),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: [
                        TextSpan(
                            text: scores[0],
                            style: TextStyle(
                                color: team1Score > team2Score
                                    ? Colors.black
                                    : Colors.black)),
                        TextSpan(text: ' : '),
                        TextSpan(
                            text: scores[1],
                            style: TextStyle(
                                color: team2Score > team1Score
                                    ? Colors.black
                                    : Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Image.asset(team2Logo, height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LiveScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "World Cup",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Full Time",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/france.png',
                              width: 50,
                              height: 50,
                            ),
                            Text('France'),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                  text: '2',
                                  style: TextStyle(color: Colors.green)),
                              TextSpan(text: ' : '),
                              TextSpan(text: '1'),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/japan.png',
                              width: 50,
                              height: 50,
                            ),
                            Text('Japan'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/comeni.png',
                    ),
                  ),
                  title: Text('Man Of The Match'),
                  subtitle: Text('Aurélien Tchouaméni'),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Stats',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        MatchStatRow(
                          title: 'Total Shots',
                          leftValue: '12',
                          rightValue: '5',
                        ),
                        MatchStatRow(
                          title: 'Shots on Target',
                          leftValue: '7',
                          rightValue: '2',
                        ),
                        MatchStatRow(
                          title: 'Possession',
                          leftValue: '86%',
                          rightValue: '53%',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MatchStatRow extends StatelessWidget {
  final String title;
  final String leftValue;
  final String rightValue;

  MatchStatRow({
    required this.title,
    required this.leftValue,
    required this.rightValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              leftValue,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              rightValue,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

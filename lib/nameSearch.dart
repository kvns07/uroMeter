import 'package:flutter/material.dart';
import 'package:urometer/Graph.dart';
class NameSearchPage extends StatefulWidget {
  @override
  _NameSearchPageState createState() => _NameSearchPageState();
}

class _NameSearchPageState extends State<NameSearchPage> {
  final List<String> _names = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Edward',
    'Fiona',
    'George',
    'Hannah',
    'Isla',
    'Jack',
    'Kevin',
    'Liam',
    'Mona',
    'Nina',
    'Oliver',
    'Peter',
    'Quincy',
    'Rachel',
    'Sam',
    'Tom',
    'Uma',
    'Violet',
    'William',
    'Xander',
    'Yvonne',
    'Zach'
  ];

  List<String> _filteredNames = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      filterNames();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void filterNames() {
    List<String> _namesToShow = [];
    if (_searchController.text.isNotEmpty) {
      _namesToShow = _names
          .where((name) =>
          name.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredNames = _namesToShow;
    });
  }
  final List<String> _history = [];
  void _addName(String name) {

      setState(() {
        _history.add(name);
      });

  }
  @override
  Widget build(BuildContext context) {
    const wsUrl = "ws://192.168.35.244:8080";
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Action for notifications button
              print('Notifications button pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Action for settings button
              print('Settings button pressed');
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String result) {
              if(result=='Logout'){
                return Navigator.pop(context);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'Logout',
                child: Text('Logout'),

              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding:  const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome Test1',
                style: TextStyle(fontSize: 18,color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding:  const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Device ID: PROT_tst_01',
                style: TextStyle(fontSize: 18,color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for Patients',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: _filteredNames.isNotEmpty
                ? ListView.builder(
              itemCount: _filteredNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredNames[index]),
                  onTap: () {
                    _addName(_filteredNames[index]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Graph()),
                    );
                  },
                );
              },
            )
                : Column(
                  children: [
                    Text('Search history',style: TextStyle(
                      fontSize: 16,
                    ),),
                    Expanded(
                                  child: ListView.builder(
                    itemCount: _history.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_history[index]),
                      );
                    },
                                  ),
                                ),
                  ],
                ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration),
            label: 'Calibration',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: 'About',
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}
class NameDetailsPage extends StatelessWidget {
  final String name;

  NameDetailsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text(
          'Details about $name',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Search'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Graph()),
                    );
                  },
                );
              },
            )
                : Center(child: Text('No names to display')),
          ),
        ],
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
import 'package:bloc_api_integration/Features/albums/Ui/albums.dart';
import 'package:bloc_api_integration/Features/comments/Ui/comments.dart';
import 'package:bloc_api_integration/Features/photos/Ui/photos.dart';
import 'package:bloc_api_integration/Features/posts/Ui/posts.dart';
import 'package:bloc_api_integration/Features/todos/Ui/todo.dart';
import 'package:bloc_api_integration/Features/users/Ui/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Albums(),
    Comments(),
    Photos(),
    Posts(),
    Todo(),
    Users(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: Text('Home'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true, // Show labels for unselected items
        showSelectedLabels: true,
        onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.album_sharp, color: Colors.black),
            label: 'Album',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment, color: Colors.black),
            label: 'Comment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo, color: Colors.black),
            label: 'Photo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add, color: Colors.black),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today, color: Colors.black),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user, color: Colors.black),
            label: 'Verified',
          ),
        ],
      ),
    );
  }
}

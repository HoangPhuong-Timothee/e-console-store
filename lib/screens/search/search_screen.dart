import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.searchName}) : super(key: key);
  final String searchName;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

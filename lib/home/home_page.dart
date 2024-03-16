import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homework_6/home/widgets/API_endpoint.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget buildPageBody() {
      return const API_endpoint();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('President of the United States', style: GoogleFonts.roboto()),
        backgroundColor: Color(0xFFF1EFE7),
        elevation: 0,
      ),
      body: buildPageBody(),
    );
  }
}

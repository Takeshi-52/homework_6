import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:homework_6/models/President_details.dart';
import 'package:homework_6/models/Presidents.dart';

class API_endpoint extends StatefulWidget {
  const API_endpoint({super.key});

  @override
  State<API_endpoint> createState() => _API_endpointState();
}

class _API_endpointState extends State<API_endpoint> {
  List<Presidents>? _presiden;
  Presidents? _selectedPresident;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    var dio = Dio(BaseOptions(responseType: ResponseType.plain));
    try {
      var response =
          await dio.get('https://api.sampleapis.com/presidents/presidents');
      print('Response data: $response');
      print('Status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      List<dynamic> list = jsonDecode(response.data);
      setState(() {
        _presiden = list.map((item) => Presidents.fromJson(item)).toList();
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void _handleDismissed(BuildContext context) {
    Navigator.of(context).pop();
    setState(() {
      _selectedPresident = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _presiden == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _presiden!.length,
                  itemBuilder: (context, index) {
                    var president = _presiden![index];
                    return ListTile(
                      title: Text(president.name ?? ''),
                      subtitle: Text(president.ordinal.toString() ?? ''),
                      trailing: president.photo == ''
                          ? null
                          : Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                )
                              ]
                            ),
                            child: Image.network(
                                president.photo ?? '',
                                errorBuilder: (context, person, StackTrace) {
                                  return const Icon(Icons.person, color: Colors.black);
                                },
                              ),
                          ),
                      onTap: () {
                        setState(() {
                          _selectedPresident = president;
                        });
                        _showPresidentDialog(context, president);
                        print('You click ${president.name}');
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _showPresidentDialog(BuildContext context, Presidents president) {
    showDialog(
      context: context,
      barrierDismissible: false,  //to disable tap outside
      builder: (context) {
        return Builder(
          builder: (BuildContext context) {
            return PresidentDetailsDialog(
              president: president,
              onDismiss: () => _handleDismissed(context),
            );
          },
        );
      },
    );
  }
}

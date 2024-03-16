import 'package:flutter/material.dart';
import 'package:homework_6/models/Presidents.dart';

class PresidentDetailsDialog extends StatelessWidget {
  final Presidents president;
  final VoidCallback onDismiss;

  const PresidentDetailsDialog({
    Key? key,
    required this.president,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Color(0xFFE1DCCA),
      elevation: 0,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    president.name ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.home),
                      const SizedBox(width: 8),
                      Text('Ordinal: ${president.ordinal}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 8),
                      Text('Years in Office: ${president.yearInOffice ?? ''}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.group),
                      const SizedBox(width: 8),
                      Text('Vice Presidents: ${president.vice ?? ''}'),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: president.photo == ''
                        ? const SizedBox()
                        : Image.network(
                            president.photo ?? '',
                            errorBuilder: (context, person, stackTrace) { 
                              return Container();//const Icon(Icons.person_2, color: Colors.black);
                            },
                          ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Close'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showPresidentDetailsDialog(BuildContext context, Presidents president, {required void Function() onDismiss}) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) {
      return PresidentDetailsDialog(
        president: president,
        onDismiss: onDismiss,
      );
    },
  );
}

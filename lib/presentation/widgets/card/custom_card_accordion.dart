import 'package:flutter/material.dart';

class CustomAccordion extends StatefulWidget {
  final String title;
  final String text;
  const CustomAccordion({super.key, required this.title, required this.text});

  @override
  CustomAccordionState createState() => CustomAccordionState();
}

class CustomAccordionState extends State<CustomAccordion> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ExpansionTile(
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
          ),
          trailing: AnimatedRotation(
            duration: Duration(milliseconds: 200),
            turns: _isExpanded ? 0.5 : 0,
            child: Icon(Icons.keyboard_arrow_down, color: Colors.orange),
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DiaryCard extends StatefulWidget {
  final String title;
  final String content;
  final List<String> tags;
  final DateTime createdAt;

  DiaryCard({
    required this.title,
    required this.content,
    required this.tags,
    required this.createdAt,
  });

  @override
  _DiaryCardState createState() => _DiaryCardState();
}

class _DiaryCardState extends State<DiaryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            renderTitle(),
            Container(height: 8),
            renderContent(),
            Container(height: 8),
            renderTags(),
          ],
        ),
      ),
    );
  }

  renderTags() {
    return Wrap(
      spacing: 8.0,
      children: widget.tags
          .map(
            (e) => Container(
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: Text(
                  e,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  renderContent() {
    return Row(
      children: [
        Flexible(
          child: Text(
            widget.content,
            style: TextStyle(
              color: Colors.grey,
            ),
            maxLines: 3,
          ),
        ),
      ],
    );
  }

  renderTitle() {
    final ca = widget.createdAt;

    final dateStr = '${ca.year}-${ca.month}-${ca.day}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          dateStr,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

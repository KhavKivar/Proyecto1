import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  const Tags(List<String> this.tags, {Key? key})
      : assert(
          tags != null,
          'A non-null List<String> must be provided to the Tags constructor.',
        ),
        super(key: key);
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: tags.map((tag) => _Tag(tagName: tag)).toList(),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({Key? key, required this.tagName}) : super(key: key);
  final String tagName;
  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.amber,
      avatar: CircleAvatar(
        backgroundColor: Colors.white,
        child: const Text('icon'),
      ),
      label: Text(
        tagName,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
/*

 Row(
      children: [
        Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(tagName),
      ],
    ); */
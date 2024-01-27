import 'package:flutter/material.dart';

enum TitlePosition {
  start(position: CrossAxisAlignment.start),
  center(position: CrossAxisAlignment.center),
  end(position: CrossAxisAlignment.end);

  const TitlePosition({required this.position});

  final CrossAxisAlignment position;
}

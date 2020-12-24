import 'package:bubble_any_position/bubble_any_position.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('show custom clipper default style', () {
    final bubbleClipper = BubbleClipper();
    ClipPath(
      clipper: bubbleClipper,
      child: Text('test custom clipper'),
    );
  });
}

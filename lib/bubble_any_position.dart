library bubble_any_position;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建时间：2020/8/8
/// 作者：monkey
/// 描述：

/// bubble 位置
enum BubbleType {
  leftTop,
  leftCenter,
  leftBottom,
  rightTop,
  rightCenter,
  rightBottom,
  topLeft,
  topCenter,
  topRight,
  bottomLeft,
  bottomCenter,
  bottomRight
}

/// bubble 裁剪
class BubbleClipper extends CustomClipper<Path> {
  BubbleClipper(
      {this.bubbleType = BubbleType.topLeft,
      this.bubbleW = 10.0,
      this.bubbleH = 8.0,
      this.bubbleTop = 10.0,
      this.radius = 15.0})
      : super();

  /// bubble 位置：上左下右
  final BubbleType bubbleType;

  /// 尖角贴近 widget 一边的宽度：缺口宽度
  final double bubbleW;

  /// 尖角贴近 widget 一边的到顶点的高度：缺口到顶点的高度
  final double bubbleH;

  /// 尖角的起始位置距离 widget 对应边框的距离：bubbleType 为 topLeft 时，代表距离左边框的位置
  final double bubbleTop;

  /// 裁剪后的圆角：没有圆角时请传 0
  final double radius;

  @override
  Path getClip(Size size) {
    switch (bubbleType) {
      case BubbleType.topLeft:
      case BubbleType.topCenter:
      case BubbleType.topRight:
        return _topBubblePath(size);
      case BubbleType.bottomLeft:
      case BubbleType.bottomCenter:
      case BubbleType.bottomRight:
        return _bottomBubblePath(size);
      case BubbleType.leftTop:
      case BubbleType.leftCenter:
      case BubbleType.leftBottom:
        return _leftBubblePath(size);

      case BubbleType.rightTop:
      case BubbleType.rightCenter:
      case BubbleType.rightBottom:
        return _rightBubblePath(size);
      default:
        return Path();
    }
  }

  Path _topBubblePath(Size size) {
    double _bubbleTop = 0;
    switch (bubbleType) {
      case BubbleType.topLeft:
        _bubbleTop = bubbleTop + radius;
        break;
      case BubbleType.topCenter:
        _bubbleTop = size.width / 2 - bubbleW / 2;
        break;
      case BubbleType.topRight:
        _bubbleTop = size.width - bubbleTop - bubbleW - radius;
        break;
      default:
        break;
    }
    Path path = Path()
      ..moveTo(radius, bubbleH)
      // 尖角起点
      ..lineTo(_bubbleTop, bubbleH)
      // 尖角顶点
      ..lineTo(_bubbleTop + bubbleW / 2, 0)
      // 尖角终点
      ..lineTo(_bubbleTop + bubbleW, bubbleH)
      // 右上角
      ..lineTo(size.width - radius, bubbleH)
      // 圆角
      ..arcToPoint(Offset(size.width, bubbleH + radius),
          radius: Radius.circular(radius))
      // 右下角
      ..lineTo(size.width, size.height - radius)
      // 圆角
      ..arcToPoint(Offset(size.width - radius, size.height),
          radius: Radius.circular(radius))
      // 左下角
      ..lineTo(radius, size.height)
      // 圆角
      ..arcToPoint(Offset(0, size.height - radius),
          radius: Radius.circular(radius))
      // 左上角
      ..lineTo(0, bubbleH + radius)
      // 圆角
      ..arcToPoint(Offset(radius, bubbleH), radius: Radius.circular(radius))
      ..close();
    return path;
  }

  Path _bottomBubblePath(Size size) {
    double _bubbleTop = 0;
    switch (bubbleType) {
      case BubbleType.bottomLeft:
        _bubbleTop = bubbleTop + radius;
        break;
      case BubbleType.bottomCenter:
        _bubbleTop = size.width / 2 - bubbleW / 2;
        break;
      case BubbleType.bottomRight:
        _bubbleTop = size.width - bubbleTop - bubbleW - radius;
        break;
      default:
        break;
    }
    Path path = Path()
      ..moveTo(radius, size.height - bubbleH)
      // 尖角起点
      ..lineTo(_bubbleTop, size.height - bubbleH)
      // 尖角顶点
      ..lineTo(_bubbleTop + bubbleW / 2, size.height)
      // 尖角终点
      ..lineTo(_bubbleTop + bubbleW, size.height - bubbleH)
      // 右下角
      ..lineTo(size.width - radius, size.height - bubbleH)
      // 圆角
      ..arcToPoint(Offset(size.width, size.height - radius),
          radius: Radius.circular(radius), clockwise: false)
      // 右上角
      ..lineTo(size.width, radius)
      // 圆角
      ..arcToPoint(Offset(size.width - radius, 0),
          radius: Radius.circular(radius), clockwise: false)
      // 左上角
      ..lineTo(radius, 0)
      // 圆角
      ..arcToPoint(Offset(0, radius),
          radius: Radius.circular(radius), clockwise: false)
      // 左下角
      ..lineTo(0, size.height - radius)
      // 圆角
      ..arcToPoint(Offset(radius, size.height - bubbleH),
          radius: Radius.circular(radius), clockwise: false)
      ..close();
    return path;
  }

  Path _leftBubblePath(Size size) {
    double _bubbleTop = 0;
    switch (bubbleType) {
      case BubbleType.leftTop:
        _bubbleTop = bubbleTop + radius;
        break;
      case BubbleType.leftCenter:
        _bubbleTop = size.height / 2 - bubbleW / 2;
        break;
      case BubbleType.leftBottom:
        _bubbleTop = size.height - bubbleTop - bubbleW - radius;
        break;
      default:
        break;
    }
    Path path = Path()
      ..moveTo(bubbleH, radius)
      // 尖角起点
      ..lineTo(bubbleH, _bubbleTop)
      // 尖角顶点
      ..lineTo(0, _bubbleTop + bubbleW / 2)
      // 尖角终点
      ..lineTo(bubbleH, _bubbleTop + bubbleW)
      // 左下角
      ..lineTo(bubbleH, size.height - radius)
      // 圆角
      ..arcToPoint(Offset(radius, size.height),
          radius: Radius.circular(radius), clockwise: false)
      // 右下角
      ..lineTo(size.width - radius, size.height)
      // 圆角
      ..arcToPoint(Offset(size.width, size.height - radius),
          radius: Radius.circular(radius), clockwise: false)
      // 右上角
      ..lineTo(size.width, radius)
      // 圆角
      ..arcToPoint(Offset(size.width - radius, 0),
          radius: Radius.circular(radius), clockwise: false)
      // 左上角
      ..lineTo(bubbleH + radius, 0)
      // 圆角
      ..arcToPoint(Offset(bubbleH, radius),
          radius: Radius.circular(radius), clockwise: false)
      ..close();
    return path;
  }

  Path _rightBubblePath(Size size) {
    double _bubbleTop = 0;
    switch (bubbleType) {
      case BubbleType.rightTop:
        _bubbleTop = bubbleTop + radius;
        break;
      case BubbleType.rightCenter:
        _bubbleTop = size.height / 2 - bubbleW / 2;
        break;
      case BubbleType.rightBottom:
        _bubbleTop = size.height - bubbleTop - bubbleW - radius;
        break;
      default:
        break;
    }
    Path path = Path()
      ..moveTo(size.width - bubbleH, radius)
      // 尖角起点
      ..lineTo(size.width - bubbleH, _bubbleTop)
      // 尖角顶点
      ..lineTo(size.width, _bubbleTop + bubbleW / 2)
      // 尖角终点
      ..lineTo(size.width - bubbleH, _bubbleTop + bubbleW)
      // 右下角
      ..lineTo(size.width - bubbleH, size.height - radius)
      // 圆角
      ..arcToPoint(Offset(size.width - radius, size.height),
          radius: Radius.circular(radius))
      // 左下角
      ..lineTo(radius, size.height)
      // 圆角
      ..arcToPoint(Offset(0, size.height - radius),
          radius: Radius.circular(radius))
      // 左上角
      ..lineTo(0, radius)
      // 圆角
      ..arcToPoint(Offset(radius, 0), radius: Radius.circular(radius))
      // 右上角
      ..lineTo(size.width - bubbleH - radius, 0)
      // 圆角
      ..arcToPoint(Offset(size.width - bubbleH, radius),
          radius: Radius.circular(radius))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

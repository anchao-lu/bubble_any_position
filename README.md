# bubble_any_position

自定义 Clipper 实现任意位置 bubble

# 使用方法
```
pubspec.yaml:
  bubble_any_position:
    git:
      url: https://github.com/Lanch92/bubble_any_position.git
```
      
## import
```
import 'package:bubble_any_position/bubble_any_position.dart';
```

## 应用
```
ClipPath(
      clipper: BubbleClipper(),
      child: Text('test custom clipper'),
    );
```

## 注意
### bubble 所在边应该留出 bubble 高度对应的 padding

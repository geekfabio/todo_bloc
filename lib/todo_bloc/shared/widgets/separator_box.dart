import 'package:flutter/widgets.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/style.dart';

/// Usado para separa elementos
class SeparatorBox extends StatelessWidget {
  const SeparatorBox(this._size, this._scale, {Key? key}) : super(key: key);
  final double _size;
  final double _scale;

  const SeparatorBox.xSmall({Key? key, double scale = 1})
      : _size = Insets.xs,
        _scale = scale,
        super(key: key);

  const SeparatorBox.small({Key? key, double scale = 1})
      : _size = Insets.sm,
        _scale = scale,
        super(key: key);
  const SeparatorBox.medium({Key? key, double scale = 1})
      : _size = Insets.md,
        _scale = scale,
        super(key: key);
  const SeparatorBox.large({Key? key, double scale = 2})
      : _size = Insets.lg,
        _scale = scale,
        super(key: key);
  const SeparatorBox.xLarge({Key? key, double scale = 1})
      : _size = Insets.xl,
        _scale = scale,
        super(key: key);
  const SeparatorBox.offset({Key? key, double scale = 1})
      : _size = Insets.offset,
        _scale = scale,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(_size * _scale, _size * _scale),
    );
  }
}

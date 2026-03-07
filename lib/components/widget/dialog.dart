import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DialogType { success, error, info }

enum DialogAction { ok, yes, cancel }

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final DialogType type;
  final List<DialogAction> actions;
  final void Function(DialogAction) onActionPressed;

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    required this.type,
    required this.actions,
    required this.onActionPressed,
  });

  IconData _getIcon() {
    switch (type) {
      case DialogType.success:
        return Icons.check_circle;
      case DialogType.error:
        return Icons.error;
      case DialogType.info:
        return Icons.info;
    }
  }

  Color _getIconColor() {
    switch (type) {
      case DialogType.success:
        return Colors.green;
      case DialogType.error:
        return Colors.red;
      case DialogType.info:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_getIcon(), color: _getIconColor(), size: 60),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(message, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

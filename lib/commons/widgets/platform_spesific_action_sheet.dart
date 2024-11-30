import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformSpesificActionSheet extends StatelessWidget {
  const PlatformSpesificActionSheet({
    super.key,
    this.title,
    this.message,
    required this.cancelButtonText,
    required this.items,
    this.barrierDismissible = true,
  });

  final String? title;
  final String? message;
  final String cancelButtonText;
  final List<String> items;
  final bool barrierDismissible;

  Future<int?> showActionSheet(BuildContext context) async {
    return !kIsWeb && (Platform.isIOS || Platform.isMacOS)
        ? showCupertinoModalPopup<int?>(
            context: context,
            builder: (context) => this,
            barrierDismissible: barrierDismissible,
          )
        : showDialog<int?>(
            context: context,
            builder: (context) => this,
            barrierDismissible: barrierDismissible,
          );
  }

  @override
  Widget build(BuildContext context) {
    return !kIsWeb && (Platform.isIOS || Platform.isMacOS)
        ? CupertinoActionSheet(
            title: title != null ? Text(title!) : null,
            message: message != null ? Text(message!) : null,
            actions: items
                .map((e) => CupertinoActionSheetAction(
                      onPressed: () => Navigator.pop(context, items.indexOf(e)),
                      child: Text(
                        e,
                        key: Key("PlatformSpesificActionSheetItem${items.indexOf(e)}"),
                      ),
                    ))
                .toList(),
            cancelButton: CupertinoActionSheetAction(
              key: const Key("PlatformSpesificActionSheetCancelButton"),
              onPressed: () => Navigator.pop(context, null),
              child: Text(cancelButtonText),
            ),
          )
        : AlertDialog(
            title: title != null ? Text(title!) : null,
            contentPadding: const EdgeInsets.only(top: 10),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: items
                    .map((e) => SimpleDialogOption(
                          onPressed: () => Navigator.pop(context, items.indexOf(e)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              e,
                              key: Key("PlatformSpesificActionSheetItem${items.indexOf(e)}"),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            actions: [
              TextButton(
                key: const Key("PlatformSpesificActionSheetCancelButton"),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  cancelButtonText,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          );
  }
}

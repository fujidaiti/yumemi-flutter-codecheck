import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class SearchBox extends HookWidget {
  const SearchBox({
    super.key,
    this.initialText,
    this.hintText,
    this.onSubmitted,
    this.onTextChanged,
    this.autoFocus = true,
  });

  final String? initialText;
  final String? hintText;
  final void Function(String text)? onSubmitted;
  final void Function(String text)? onTextChanged;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialText);
    final focusNode = useFocusNode();
    final text = useListenable(controller).text;
    final hasFocus = useListenable(focusNode).hasFocus;

    void onClearButtonPressed() {
      controller.text = "";
      this.onTextChanged?.call("");
    }

    void onTextChanged(String text) {
      this.onTextChanged?.call(text);
    }

    void onSubmitted(String text) {
      if (text.isNotEmpty) {
        this.onSubmitted?.call(text);
      } else {
        // 何も入力されていない場合はキーボードを閉じない
        focusNode.requestFocus();
      }
    }

    void onBackButtonPressed() {
      Navigator.of(context).pop();
    }

    final canPop = ModalRoute.of(context)?.canPop ?? false;
    final leadingIcon = switch (canPop) {
      true => IconButton(
          onPressed: onBackButtonPressed,
          icon: const Icon(Icons.arrow_back),
          tooltip: "Back",
        ),
      false => const Icon(OctIcons.search_24),
    };

    final clearButton = switch (hasFocus && text.isNotEmpty) {
      true => IconButton(
          onPressed: onClearButtonPressed,
          icon: const Icon(OctIcons.x_16),
          tooltip: "Clear field",
        ),
      false => null,
    };

    final textFiled = TextField(
      onChanged: onTextChanged,
      onSubmitted: onSubmitted,
      controller: controller,
      autofocus: autoFocus,
      textInputAction: TextInputAction.search,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
      ),
    );

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
      ),
      child: Material(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leadingIcon,
            Expanded(child: textFiled),
            if (clearButton != null) clearButton,
          ],
        ),
      ),
    );
  }
}

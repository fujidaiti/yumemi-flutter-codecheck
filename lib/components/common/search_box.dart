import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

class SearchBox extends HookWidget {
  const SearchBox({
    super.key,
    this.initialText,
    this.onSubmitted,
    this.onTextChanged,
    this.autoFocus = true,
  });

  final String? initialText;
  final void Function(String text)? onSubmitted;
  final void Function(String text)? onTextChanged;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialText);
    final focusNode = useFocusNode();
    final hasFocus = useState(false);
    final hasText = useState(initialText?.isNotEmpty == true);

    void clearText() {
      controller.text = "";
      hasText.value = false;
    }

    void onFocusChanged(bool value) {
      hasFocus.value = value;
    }

    void onTextChanged(String text) {
      hasText.value = text.isNotEmpty;
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

    void onBackButtonPressed() => Navigator.of(context).pop();

    final canPop = ModalRoute.of(context)?.canPop ?? false;
    final leadingIcon = switch (canPop) {
      true => IconButton(
          onPressed: onBackButtonPressed,
          icon: const Icon(Icons.arrow_back),
        ),
      false => const Icon(OctIcons.search_24),
    };

    final clearButton = switch (hasFocus.value && hasText.value) {
      true => IconButton(
          onPressed: clearText,
          icon: const Icon(OctIcons.x_16),
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
            Expanded(
              child: Focus(
                onFocusChange: onFocusChanged,
                child: textFiled,
              ),
            ),
            if (clearButton != null) clearButton,
          ],
        ),
      ),
    );
  }
}

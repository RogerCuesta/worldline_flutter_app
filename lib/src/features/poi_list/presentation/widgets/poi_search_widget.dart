import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:worldline_flutter_app/src/config/l10n/l10n.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String?> onSubmitted;

  const SearchWidget({
    Key? key,
    required this.controller,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormBuilder(
        child: FormBuilderTextField(
          name: 'search',
          controller: controller,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            labelText: l10n.searchFieldLabelText,
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

class CustomItemSelector extends StatefulWidget {
  const CustomItemSelector({
    super.key,
    this.width,
    this.height,
    required this.selectedItems,
    required this.allItems,
    this.itemListHeight,
    this.onItemSelected,
    this.onItemCreated,
    required this.enableAddNewOption,
    this.onAction,
    this.hintText,
  });

  final double? width;
  final double? height;
  final List<String> selectedItems;
  final List<ItemStruct> allItems;
  final double? itemListHeight;
  final Future Function(ItemStruct? value)? onItemSelected;
  final Future Function(ItemStruct? value)? onItemCreated;
  final bool enableAddNewOption;
  final Future Function(ActionStruct? value)? onAction;
  final String? hintText;

  @override
  State<CustomItemSelector> createState() => _CustomItemSelectorState();
}

class _CustomItemSelectorState extends State<CustomItemSelector> {
  final _focusNode = FocusNode();

  /// Map of all items with key as item ID & value as title
  Map<String, String> itemsList = <String, String>{};

  /// Map of selected items with key as item ID & value as
  /// boolean : true if item is selected permanently else false
  Map<String, bool> selectedItems = <String, bool>{};

  ///
  Map<String, String> displayItems = <String, String>{};

  ///
  bool showSuggestions = false;

  ///
  String err = '';

  ///
  String searchQuery = '';

  bool itemAlreadyExists(String title) => itemsList.values.toList().any(
        (element) => element.toLowerCase() == title.toLowerCase(),
      );

  String get displayValue => searchQuery.isNotEmpty
      ? searchQuery
      : itemsList.keys
          .toList()
          .where((element) => selectedItems.keys.contains(element))
          .map((e) => itemsList[e])
          .toList()
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '');

  bool isItemSelected(String item) =>
      selectedItems.keys.toList().contains(item);

  @override
  void initState() {
    super.initState();

    for (var element in widget.allItems) {
      itemsList[element.id] = element.value;
    }

    for (var element in widget.allItems) {
      displayItems[element.id] = element.value;
    }

    selectedItems.addAll(
      Map.fromEntries(
        widget.selectedItems.map(
          (e) => MapEntry(
            e,
            false,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                showSuggestions = true;
                FocusScope.of(context).requestFocus(_focusNode);
              });
            },
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Wrap(
                      key: ValueKey(
                        selectedItems.length,
                      ),
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        ...selectedItems.keys
                            .map(
                              (key) => ChipWidget(
                                label: itemsList[key] ?? 'N/A',
                                onRemove: (selectedItems[key] ?? false)
                                    ? null
                                    : () {
                                        setState(() {
                                          if (selectedItems[key] ?? false) {
                                            return;
                                          }
                                          _clearError();
                                          selectedItems.remove(key);
                                          widget.onAction?.call(
                                            ActionStruct(
                                                key: 'unselect', value: key),
                                          );
                                        });
                                      },
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(6)),
                                backGroundColor: Colors.transparent,
                                labelColor: Colors.grey.shade900,
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.grey.shade900,
                                    ),
                                borderColor: Colors.grey.shade400,
                              ),
                            )
                            .toList(),
                        ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 48),
                          child: IntrinsicWidth(
                            child: Row(
                              children: [
                                if (searchQuery.isEmpty) ...[
                                  const Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                ],
                                Expanded(
                                  child: TextFormField(
                                    focusNode: _focusNode,
                                    key: ValueKey(
                                      selectedItems.length,
                                    ),
                                    initialValue: searchQuery,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: Colors.grey.shade800,
                                        ),
                                    decoration: InputDecoration(
                                      hintText: widget.hintText ?? 'Search',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Colors.grey,
                                          ),
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      counterText: '',
                                    ),
                                    onChanged: (v) {
                                      setState(() {
                                        searchQuery = v;
                                        _onSearchQueryChange();
                                      });
                                    },
                                    onTap: () {
                                      setState(() {
                                        showSuggestions = true;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: _toggleListVisibility,
                    child: Icon(
                      showSuggestions
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          if (err.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                err,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.red),
              ),
            )
          else
            const SizedBox.shrink(),
          if (showSuggestions)
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  if (displayItems.isEmpty && !widget.enableAddNewOption)
                    ListTile(
                      title: Text(
                        'No item found',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.black),
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  if (searchQuery.isNotEmpty && widget.enableAddNewOption)
                    ListTile(
                      title: Text(
                        'Add new item',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.black),
                      ),
                      onTap: () {
                        setState(() {
                          if (!widget.enableAddNewOption) {
                            return;
                          }
                          var newTag = searchQuery.trim();
                          if (newTag.isEmpty) {
                            return;
                          }
                          if (itemAlreadyExists(newTag)) {
                            err = 'Item already exists';
                            return;
                          }
                          var item = ItemStruct(
                            id: Random().nextInt(60 * 1000).toString(),
                            value: newTag,
                          );
                          itemsList[item.id] = item.value;
                          selectedItems[item.id] = false;
                          widget.onItemCreated?.call(item);
                          searchQuery = '';
                          showSuggestions = false;
                        });
                      },
                    )
                  else
                    const SizedBox.shrink(),
                  SizedBox(
                    height: widget.itemListHeight ?? 250,
                    child: ListView.separated(
                      padding: const EdgeInsets.all(6),
                      shrinkWrap: true,
                      itemCount: displayItems.length,
                      itemBuilder: (context, index) {
                        final tag = displayItems.keys.toList()[index];
                        return ListTile(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          selectedTileColor: Colors.grey.shade50,
                          trailing: SizedBox(
                            height: 20,
                            width: 20,
                            child: isItemSelected(tag)
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.blueGrey,
                                  )
                                : null,
                          ),
                          selected: isItemSelected(tag),
                          title: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  displayItems[tag] ?? 'N/A',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Colors.blueGrey,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              _clearError();
                              if (isItemSelected(tag)) {
                                err = 'Item already selected';
                                return;
                              }
                              selectedItems[tag] = false;
                              widget.onItemSelected?.call(
                                widget.allItems[
                                    itemsList.keys.toList().indexOf(tag)],
                              );
                              searchQuery = '';
                              showSuggestions = false;
                            });
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 4,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            const SizedBox.shrink(),
        ],
      );

  void _clearError() {
    err = '';
  }

  void _toggleListVisibility() {
    setState(() {
      showSuggestions = !showSuggestions;
    });
  }

  void _onSearchQueryChange() {
    err = '';
    displayItems.clear();
    if (searchQuery.isEmpty) {
      displayItems.addAll(itemsList);
      return;
    }
    var filteredValues = <String, String>{};
    itemsList.forEach((key, value) {
      if (value.toLowerCase().contains(searchQuery.toLowerCase())) {
        filteredValues[key] = value;
      }
    });
    displayItems.addAll(filteredValues);
  }
}

/// Chip Widget to display tags
class ChipWidget extends StatefulWidget {
  ///
  const ChipWidget({
    required this.label,
    this.backGroundColor,
    this.onRemove,
    this.labelStyle,
    this.labelColor,
    this.borderRadius,
    this.borderColor,
    Key? key,
  }) : super(key: key);

  /// Chip label
  final String label;

  /// Chip label color
  final Color? labelColor;

  /// Chip background color
  final Color? backGroundColor;

  /// On remove(x) action button event
  final VoidCallback? onRemove;

  /// On remove(x) action button event
  final TextStyle? labelStyle;

  ///
  final BorderRadius? borderRadius;

  ///
  final Color? borderColor;

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: widget.backGroundColor ?? Colors.grey.shade100,
          borderRadius: widget.borderRadius ??
              const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 4,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  widget.label,
                  style: widget.labelStyle ??
                      Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: widget.labelColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Visibility(
                visible: widget.onRemove != null,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: widget.onRemove,
                      child: const Icon(Icons.close, size: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

library grid_selector;

import 'package:flutter/material.dart';
import 'package:grid_selector/grid_selector_item.dart';

class GridSelector<TKey> extends StatefulWidget {
  final List<GridSelectorItem<TKey>> items;
  final Function(TKey selectedKey) onSelectionChanged;

  final TKey selectedItemKey;
  final String title;
  final bool multipleSelection = false;

  final Color backgroundColor;

  final Color backgroundSelectedColor;

  final Color backgroundDisableColor;

  final Color itemTextColor;

  final Color itemTextSelectedColor;

  final double itemSize;

  final double borderWidth;

  final Color borderColor;

  final double itemTextFontSize;

  final TextStyle titleTextStyle;

  final Widget emptyView;

  GridSelector({
    @required this.title,
    @required this.items,
    @required this.onSelectionChanged,
    this.selectedItemKey,
    this.backgroundSelectedColor = const Color(0xff334250),
    this.backgroundDisableColor = const Color(0xffcfdada),
    this.backgroundColor = Colors.white,
    this.itemTextColor = const Color(0xff334250),
    this.itemTextSelectedColor = Colors.white,
    this.itemTextFontSize = 14.0,
    this.itemSize = 40.0,
    this.borderColor = const Color(0xffbcc0c0),
    this.borderWidth = 1.0,
    this.titleTextStyle,
    this.emptyView,
  });

  @override
  State<StatefulWidget> createState() {
    return _GridSelectorState<TKey>(this.selectedItemKey);
  }
}

class _GridSelectorState<TKey> extends State<GridSelector<TKey>> {
  TKey selectedItemKey;

  _GridSelectorState(this.selectedItemKey);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTitle(),
        SizedBox(
          height: 8.0,
        ),
        _buildSelector(),
      ],
    );
  }

  Container _buildTitle() {
    return Container(
      width: double.infinity,
      child: Text(
        widget.title.toUpperCase(),
        style: widget.titleTextStyle != null
            ? widget.titleTextStyle
            : Theme.of(context).textTheme.title,
      ),
    );
  }

  Container _buildSelector() {
    if (widget.items.isEmpty) {
      return _buildEmptyView();
    }

    return Container(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 8.0,
        runSpacing: 4.0,
        children: buildItems(this.widget.items),
      ),
    );
  }

  Widget _buildEmptyView() {
    return this.widget.emptyView != null
        ? this.widget.emptyView
        : Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.grid_off,
              size: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
              ),
              child: Text("Withouts options"),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildItems(List<GridSelectorItem<TKey>> items) {
    return items.map(buildItem).toList();
  }

  Widget buildItem(GridSelectorItem<TKey> item) {
    var isSelected = item.isSelected(selectedItemKey);
    return GestureDetector(
      onTap: () {
        _onItemTapped(item);
      },
      child: Container(
        width: widget.itemSize,
        height: widget.itemSize,
        decoration: _buildItemDecoration(item, isSelected),
        padding: EdgeInsets.all(4.0),
        child: Center(
          child: _buildItemText(item, isSelected),
        ),
      ),
    );
  }

  void _onItemTapped(GridSelectorItem item) {
    if (item.isEnabled) {
      setState(() {
        if (selectedItemKey == null || !item.isSelected(selectedItemKey)) {
          widget.onSelectionChanged(item.key);
          selectedItemKey = item.key;
        }
      });
    }
  }

  Text _buildItemText(GridSelectorItem item, bool isSelected) {
    return Text(
      item.label,
      style: TextStyle(
        color: _getLabelColorByItem(item, isSelected),
        fontSize: widget.itemTextFontSize,
      ),
    );
  }

  ShapeDecoration _buildItemDecoration(GridSelectorItem item, bool isSelected) {
    return ShapeDecoration(
      color: _getBackgroundColorByItem(item, isSelected),
      shape: Border.all(
        width: widget.borderWidth,
        color: widget.borderColor,
      ),
    );
  }

  Color _getBackgroundColorByItem(GridSelectorItem item, bool isSelected) {
    return isSelected
        ? widget.backgroundSelectedColor
        : item.isEnabled
        ? widget.backgroundColor
        : widget.backgroundDisableColor;
  }

  Color _getLabelColorByItem(GridSelectorItem<TKey> item, bool isSelected) {
    return isSelected ? widget.itemTextSelectedColor : widget.itemTextColor;
  }
}

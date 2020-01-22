
abstract class GridSelectorItem<TKey> {

  TKey key;

  String label;

  bool isEnabled;

  bool isSelected(TKey selectedKey);
}

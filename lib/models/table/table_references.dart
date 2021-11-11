import 'package:flutter_excel/models/table/table_data.dart';
import 'cell_name/cell_name.dart';

class TableReferences {
  final TableData table;

  final Map<CellName, Set<CellName>> _referencedBy;

  TableReferences(this.table) :
    _referencedBy = {};

  TableReferences._fromValues({
    required this.table,
    required Map<CellName, Set<CellName>> referencedBy
  }) :
    _referencedBy = referencedBy;

  factory TableReferences.fromJson({
    required TableData table,
    required Map<String, dynamic> json
  }) {
    final entries = json.entries
      .map((entry) {
        final references = (entry.value as List<dynamic>)
            .map((name) => CellName.fromString(name))
            .toSet();
        return MapEntry(CellName.fromString(entry.key), references );
      });

    return TableReferences._fromValues(
      table: table,
      referencedBy: Map.fromEntries(entries)
    );
  }

  Map<String, dynamic> toJson() {
    final entries = _referencedBy.entries
      .map((entry) => MapEntry(entry.key.text, entry.value.toList()));
    return Map.fromEntries(entries);
  }

  void stopListening(CellName listener) {
    for(final entry in _referencedBy.entries.toList()) {
      entry.value.remove(listener);

      if(entry.value.isEmpty) {
        _referencedBy.remove(entry.key);
      }
    }
  }

  void removeListener(CellName listener, CellName target) {
    final references = _referencedBy[target];

    if(references == null) {
      return;
    }

    references.remove(listener);

    if (references.isEmpty) {
      _referencedBy.remove(target);
    }
  }

  void addListener(CellName listener, CellName target) {
    _referencedBy
      .putIfAbsent(target, () => {})
      .add(listener);
  }

  void notifyListeners(CellName cellName) {
    final listeners = _referencedBy[cellName];

    if (listeners == null) {
      return;
    }

    for (final listener in listeners.toList()) {
      table.getCell(listener).update();
    }
  }

  bool containsCircularReference(CellName cellName) {
    final visitedCells = <String>{};

    bool _findCircularReference(CellName current) {
      final listeners = _referencedBy[current];

      if (listeners == null) {
        return false;
      }

      for(final listener in listeners) {
        if(listener == cellName) {
          return true;
        }

        visitedCells.add(listener.text);

        if(_findCircularReference(listener)) {
          return true;
        }
      }

      return false;
    }

    return _findCircularReference(cellName);
  }
}

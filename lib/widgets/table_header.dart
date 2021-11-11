import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excel/cubits/table_load/table_load_cubit.dart';
import 'package:flutter_excel/cubits/table_selection/table_selection_cubit.dart';
import 'package:flutter_excel/models/table/axis_data.dart';
import 'package:flutter_excel/models/table/cell_data.dart';
import 'package:flutter_excel/models/table/table_data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 6),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _HeaderIconButton(
                          onPressed: () {
                            context.read<TableLoadCubit>().createNewTable('New Table', context);
                          },
                          tooltip: 'Create new table',
                          icon: Icons.create_new_folder_outlined,
                        ),
                        _HeaderIconButton(
                          onPressed: () {
                            context.read<TableLoadCubit>().openTable(context);
                          },
                          tooltip: 'Open table',
                          icon: Icons.folder_open,
                        ),
                        _HeaderIconButton(
                          onPressed: () {
                            context.read<TableLoadCubit>().saveTable();
                          },
                          tooltip: 'Save table',
                          icon: Icons.save,
                        ),
                        _HeaderIconButton(
                          onPressed: () {
                            context.read<TableLoadCubit>().saveTableAs();
                          },
                          tooltip: 'Save table as',
                          icon: Icons.save_alt,
                        ),
                        const Spacer(),
                        BlocBuilder<TableLoadCubit, TableLoadState>(
                          builder: (context, state) => state.maybeMap(
                            loaded: (_) => _HeaderIconButton(
                              onPressed: () {
                                context.read<TableLoadCubit>().closeTable(context);
                              },
                              tooltip: 'Close table',
                              icon: Icons.close,
                            ),
                            orElse: () => const SizedBox()
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: BlocBuilder<TableLoadCubit, TableLoadState>(
                      builder: (context, state) => state.maybeMap(
                        loaded: (state) => Center(
                          child: _TableNameEditor(table: state.table),
                        ),
                        orElse: () => const SizedBox()
                      )
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 4,
              child: BlocBuilder<TableSelectionCubit, TableSelectionState>(
                builder: (context, state) => state.map(
                  none: (state) => _buildNone(context, state),
                  column: (state) => _AxisEditor(
                    key: ValueKey<int>(state.data.index),
                    axis: state.data,
                    onRemove: () {
                      state.data.table.removeColumn(state.data.index);
                      context.read<TableSelectionCubit>().cancelSelection();
                    },
                    onReset: () {
                      state.data.style = state.data.table.defaultColumnStyle;
                    },
                    tools: [
                      _SizeTool(axis: state.data)
                    ],
                  ),
                  row: (state) => _AxisEditor(
                    key: ValueKey<int>(state.data.index),
                    axis: state.data,
                    onRemove: () {
                      state.data.table.removeRow(state.data.index);
                      context.read<TableSelectionCubit>().cancelSelection();
                    },
                    onReset: () {
                      state.data.style = state.data.table.defaultRowStyle;
                    },
                    tools: [
                      _SizeTool(axis: state.data)
                    ],
                  ),
                  cell: (state) => _CellEditor(
                    key: ValueKey<String>(state.cell.name.text),
                    cell: state.cell
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNone(BuildContext context, TableSelectionNoneState state) {
    return const SizedBox();
  }
}

class _TableNameEditor extends HookWidget {
  final TableData table;

  const _TableNameEditor({
    required this.table,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    useListenable(table);
    final nameController = useTextEditingController(text: table.name);
    nameController.text = table.name;

    return TextField(
      controller: nameController,
      textAlign: TextAlign.center,
      onEditingComplete: () {
        if(nameController.text.isEmpty) {
          return;
        }

        table.name = nameController.text;
      },
      style: theme.textTheme.headline6,
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? tooltip;
  final IconData? icon;

  const _HeaderIconButton({
    this.onPressed,
    this.tooltip,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: IconButton(
        onPressed: onPressed,
        tooltip: tooltip,
        icon: Icon(icon, color: Colors.white54),
        constraints: const BoxConstraints(
          maxWidth: 32,
          maxHeight: 32
        ),
        padding: EdgeInsets.zero,
        iconSize: 20,
        splashRadius: 18,
      ),
    );
  }
}

class _CellEditor extends HookWidget {
  final CellData cell;

  const _CellEditor({
    required this.cell,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    useListenable(cell);

    final textController = useTextEditingController(text: cell.text);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(
              Icons.text_fields,
              color: Colors.white54,
            ),
            Tooltip(
              message: 'Is text field',
              waitDuration: const Duration(milliseconds: 700),
              child: Checkbox(
                checkColor: theme.primaryColor,
                fillColor: MaterialStateProperty.resolveWith((states) => Colors.blue),
                value: cell.isTextExpression,
                onChanged: (value) {
                  if(value == null) {
                    return;
                  }

                  cell.isTextExpression = value;
                  cell.update();
                }
              ),
            ),
          ],
        ),
        const VerticalDivider(),
        Expanded(
          child: TextField(
            controller: textController,
            autofocus: true,
            onChanged: (text) {
              cell.text = text;
              cell.update();
            },
          ),
        )
      ],
    );
  }
}

class _AxisEditor extends HookWidget {
  final AxisData axis;

  final void Function()? onRemove;
  final void Function()? onReset;

  final List<Widget> tools;

  const _AxisEditor({
    required this.axis,
    required this.tools,
    this.onRemove,
    this.onReset,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useListenable(axis);

    final dividedTools = tools
      .map((tool) => <Widget>[tool, const VerticalDivider()])
      .expand((pair) => pair);

    return SizedBox(
      height: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...dividedTools,
          SizedBox(
            width: 148,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onRemove,
                    icon: const Icon(Icons.remove),
                    label: const Text('Remove')
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onReset,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset')
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SizeTool extends HookWidget {
  final AxisData axis;

  const _SizeTool({
    required this.axis,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useListenable(axis);

    final size = axis.size;
    final widthController = useTextEditingController(text: size.toString());

    useValueChanged(axis.size, (oldValue, oldResult) => widthController.text = size.toString());

    return SizedBox(
      width: 136,
      child: TextFormField(
        controller: widthController,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: _validateSize,
        decoration: const InputDecoration(
          labelText: 'Size'
        ),
        onFieldSubmitted: (value) {
          if(_validateSize(value) != null) {
            return;
          }

          axis.size = double.parse(value);
        },
      )
    );
  }

  String? _validateSize(String? value) {
    if(value == null) {
      return 'Value cannot be empty';
    }

    var height = double.tryParse(value);

    if(height == null || height < 0 || height > 1000) {
      return 'Invalid value';
    }
  }
}


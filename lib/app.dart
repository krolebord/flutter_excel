import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excel/cubits/table_load/table_load_cubit.dart';
import 'package:flutter_excel/cubits/table_selection/table_selection_cubit.dart';
import 'package:flutter_excel/models/table/cell_data.dart';
import 'package:flutter_excel/models/table/column_data.dart';
import 'package:flutter_excel/models/table/row_data.dart';
import 'package:flutter_excel/models/table/styles/column_style.dart';
import 'package:flutter_excel/models/table/styles/row_style.dart';
import 'package:flutter_excel/models/table/table_data.dart';
import 'package:flutter_excel/widgets/table_header.dart';
import 'package:flutter_excel/widgets/table_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Excel',
      theme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TableSelectionCubit>(
            create: (context) => TableSelectionCubit(),
          ),
          BlocProvider<TableLoadCubit>(
            create: (context) =>
              TableLoadCubit(
                  defaultColumnStyle: const ColumnStyle(width: 72),
                  defaultRowStyle: const RowStyle(height: 36)
              ),
          ),
        ],
        child: Scaffold(
          body: BlocBuilder<TableLoadCubit, TableLoadState>(
            builder: (context, state) => state.map(
              notLoaded: (_) => const WelcomeScreen(),
              loaded: (state) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: TableHeader(),
                  ),
                  Expanded(
                    child: TableView(
                      table: state.table,
                      cellBuilder: _buildCell,
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCell(BuildContext context, ColumnData column, RowData row, CellData cell) {
    final value = cell.value;

    final String text;
    if (value is num) {
      text = value.toStringAsFixed(
          value.truncateToDouble() == value ? 0 : 2);
    }
    else {
      text = value.toString();
    }

    final cellWidget = Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );

    if (text.isNotEmpty) {
      return Tooltip(
        message: text,
        waitDuration: const Duration(milliseconds: 700),
        child: cellWidget,
      );
    }

    return cellWidget;
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Welcome!',
            style: theme.textTheme.headline5,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Made by Kiril Shevchuk K-24 Var 57'),
              Text(''),
              Text('Supported operations:'),
              Text('+ - * /'),
              Text('= < >'),
              Text('<= >= <>'),
              Text('not'),
              Text('and or'),
            ],
          ),
          SizedBox(
            width: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                  onPressed: () {
                    context.read<TableLoadCubit>().createNewTable('New Table', context);
                  },
                  child: const Text('Create new table'),
                ),
                const SizedBox(height: 6),
                OutlinedButton(
                  onPressed: () {
                    context.read<TableLoadCubit>().openTable(context);
                  },
                  child: const Text('Open table'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

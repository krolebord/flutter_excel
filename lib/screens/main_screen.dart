import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excel/hooks/use_custom_scroll_controller_hook.dart';
import 'package:flutter_excel/hooks/use_disposable_hook.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class MainScreen extends HookWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final verticalGroup = useMemoized(() => LinkedScrollControllerGroup(), const [1]);
    final sidebarController = useCustomScrollController(() => verticalGroup.addAndGet());
    final bodyController = useCustomScrollController(() => verticalGroup.addAndGet());

    final horizontalGroup = useMemoized(() => LinkedScrollControllerGroup(), const [2]);
    final headerController = useCustomScrollController(() => horizontalGroup.addAndGet());

    final body = Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Text('Header'),
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text('Left'),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: bodyController,
                    itemBuilder: (context, i) => SizedBox(
                      height: 60,
                      child: _TableRow(
                        index: i,
                        controllerGroup: horizontalGroup,
                      ),
                    )
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text('Right'),
                ),
              ],
            ),
          )
        ],
      )
    );

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
        physics: const ClampingScrollPhysics(),
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch
        }
      ),
      child: body,
    );
  }
}

class _TableRow extends HookWidget {
  final int index;
  final LinkedScrollControllerGroup controllerGroup;

  const _TableRow({
    required this.index,
    required this.controllerGroup,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useDisposable<ScrollController>(
      create: () => controllerGroup.addAndGet(),
      dispose: (controller) => controller.dispose()
    );

    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, j) {
        return Container(
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white30)
          ),
          child: Center(
            child: Text('$index $j')
          )
        );
      }
    );
  }
}

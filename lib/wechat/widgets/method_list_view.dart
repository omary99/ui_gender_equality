///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2021/7/13 11:00
///
import 'package:flutter/material.dart';

import '../constants/picker_method.dart';

class MethodListView extends StatelessWidget {
  const MethodListView({
    Key? key,
    required this.pickMethods,
    required this.onSelectMethod,
  }) : super(key: key);

  final List<PickMethod> pickMethods;
  final Function(PickMethod method) onSelectMethod;

  Widget methodItemBuilder(BuildContext context, int index) {
    final PickMethod model = pickMethods[index];
    return InkWell(
      onTap: () => onSelectMethod(model),
      onLongPress: model.onLongPress,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                color: Colors.teal,
                width: 50,
                height: 50,
                child: Center(
                  child: Icon(
                    model.icon,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              model.name,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10.0),
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        itemCount: pickMethods.length,
        itemBuilder: methodItemBuilder,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}

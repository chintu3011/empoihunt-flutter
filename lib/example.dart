import 'package:emploiflutter/ui/utils/theme/theme.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int selectedRadio = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: List.generate(4, (index) => Visibility(
            visible: selectedRadio == -1 || selectedRadio == index,
            child: ListTile(
              title: Text("test"),
              leading: Radio(
                value: index,
                groupValue: selectedRadio,
                onChanged: (int? value) {
                  setState(() {
                    selectedRadio = value!;
                  });
                },
              ),
            ),
          )),
        ),
      ),
    );
  }
}

import 'package:emploiflutter/ui/utils/form_validation.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class FieldTesting extends StatefulWidget {
  const FieldTesting({super.key});

  @override
  State<FieldTesting> createState() => _FieldTestingState();
}

class _FieldTestingState extends State<FieldTesting> {
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isVisible = false;
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (val)=>emailValidator(val),
                controller: emailController,
                decoration:   InputDecoration(
                  suffixIcon: isVisible? const Text("your error"):null,
                  hintText: "Email",
                ),
              ),
              const SizedBox(height: 100,),
              ElevatedButton(onPressed: (){
                RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                if(emailRegex.hasMatch(emailController.text)){
                  setState(() {

                  });
                  isVisible=false;
                }else{
                  setState(() {

                  });
                  isVisible = true;
                }
              }, child: const Text("Click"))
            ],
          ),
        ),
      ),
    );
  }
}

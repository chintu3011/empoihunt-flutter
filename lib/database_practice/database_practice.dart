import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class DatabasePractice extends ConsumerStatefulWidget {
  const DatabasePractice({super.key});

  @override
  ConsumerState createState() => _DatabasePracticeState();
}

class _DatabasePracticeState extends ConsumerState<DatabasePractice> {

  final firebaseDatabaseRef = FirebaseDatabase.instance.ref("Notes");
  final searchController = TextEditingController();
  final textController = TextEditingController();
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen"),
      ),
      body:  Column(
        children: [
          CommonFormField(
              controller: textController,
              hintText: "Add Something here"),

          SizedBox(height: 20.h,),
          CommonButton(btnText: "Submit", onPressed: (){
            String id = DateTime.now().microsecondsSinceEpoch.toString();
              firebaseDatabaseRef.child(id).set({
                "id":id,
                "data":textController.text
              }).then((value) => id="");
          }),
          SizedBox(height: 10.h,),

          CommonFormField(
              controller:searchController,
              hintText: "Search here",
          onChanged: (value){
                setState(() {

                });
          },
          ),
          Expanded(child: FirebaseAnimatedList(
            query: firebaseDatabaseRef,
            itemBuilder: (context, snapshot, animation, index) {
              final title = snapshot.child("data").value.toString();
              final id = snapshot.child('id').value.toString();
              if(searchController.text.isEmpty){
                 return ListTile(
                  title: Text(title),
                   trailing: PopupMenuButton(
                     onSelected: (value){
                       if(value == 1){
                         showDialog(context: context, builder: (context) {
                           editController.text = title;
                           return AlertDialog(
                             content: SizedBox(
                               height: 150.h,
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   CommonFormField(hintText: "update value",controller: editController,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       IconButton(onPressed: (){
                                         context.pop();
                                         firebaseDatabaseRef.child(id).update(
                                             {
                                               "data":editController.text
                                             }
                                         );
                                       }, icon: const Text("Ok")),
                                       IconButton(onPressed: (){
                                         context.pop();
                                       }, icon: const Text("Cancel")),
                                     ],
                                   )
                                 ],
                               ),
                             ),
                           );
                         },);
                       }else if(value ==2){
                         firebaseDatabaseRef.child(id).remove();
                       }
                     },
                     itemBuilder:(context) => [
                      const PopupMenuItem(
                        value: 1,
                          child:Text("Update")),
                      const PopupMenuItem(
                        value: 2,
                          child:Text("delete")),
                     ],
                   ),
                );
              }else if(title.toLowerCase().contains(searchController.text.toLowerCase())){
                return ListTile(
                  title: Text(title),
                );
              }else{
                return Container();
              }
            },
          ))
        ],
      ),
    );
  }
}
/*

          Expanded(
            child: StreamBuilder(
              stream: firebaseDatabaseRef.onValue,
              builder: (context,AsyncSnapshot<DatabaseEvent> snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }else if (snapshot.hasData){
                  Map<dynamic,dynamic> data = snapshot.data!.snapshot.value as Map<dynamic,dynamic>;
                  List<dynamic> list =[];
                  list.clear();
                  list = data.values.toList();
                  return ListView.builder(
                    itemCount: snapshot.data!.snapshot.children.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(list[index]['data']),
                      );
                    },
                  );
                }else{
                  return const Center(child: Text("No data Available"),);
                }
              },
            ),
          )

 */
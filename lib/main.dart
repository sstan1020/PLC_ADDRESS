import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'test.dart';

void main() {
 // runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'IO Template Demo',
//       home: const IOTemplatePage(),
//     );
//   }
// }

// class IOTemplatePage extends StatefulWidget {
//   const IOTemplatePage({super.key});

//   @override
//   State<IOTemplatePage> createState() => _IOTemplatePageState();
// }

// class _IOTemplatePageState extends State<IOTemplatePage> {
//   CSection_IO? sectionIO;
  
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   Future<void> loadData() async {
//     try {
//       final data = await CSection_IO.loadFromAsset();
//       setState(() {
//         sectionIO = data;
//       });
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to load IO template: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('IO Template'),
//       ),
//       body: sectionIO == null
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: sectionIO!.vgroups.length,
//               itemBuilder: (context, index) {
//                 final groupKey = sectionIO!.vgroups.keys.elementAt(index);
//                 final group = sectionIO!.vgroups[groupKey]!;
//                 return ExpansionTile(
//                   title: Text(groupKey),
//                   children: [
//                     ListTile(
//                       title: const Text('Inputs:'),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: group.vinputs
//                             .map((input) => Text('${input.vname}: ${input.vcomment}'))
//                             .toList(),
//                       ),
//                     ),
//                     ListTile(
//                       title: const Text('Outputs:'),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: group.voutputs
//                             .map((output) => Text('${output.vname}: ${output.vcomment}'))
//                             .toList(),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//     );
//   }
// }

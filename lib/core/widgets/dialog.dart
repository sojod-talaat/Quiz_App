// import 'package:flutter/material.dart';

// // ignore: non_constant_identifier_names
// Future<Widget> MaterialDialogs(BuildContext context,
//         {String? title, String? message}) async =>
//     await showDialog(
//       context: context,
//       builder: (dContext) {
//         return AlertDialog(
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(14))),
//           actionsPadding: const EdgeInsets.all(0),
//           title: Text(
//             title!,
//           ),
//           content: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Text(
//               message!,
//               style: const TextStyle(height: 1.6),
//             ),
//           ),
//           contentTextStyle: const TextStyle(color: Colors.grey),
//           actions: [
//             IntrinsicHeight(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text(
//                         'Cancle',
//                       )),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       'delete',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );

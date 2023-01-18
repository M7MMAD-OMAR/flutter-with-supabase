// [client] for Supabase instance
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

final supabase = Supabase.instance.client;

// small Gap
const smallGap = SizedBox(
  height: 15,
);

// large Gap
const largeGap = SizedBox(
  height: 30,
);

// extension ShowSnackBar on BuildContext {
//   void showErrorMessage(String message) {
//     ScaffoldMessenger.of(this).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           style: const TextStyle(color: Colors.redAccent),
//         ),
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}

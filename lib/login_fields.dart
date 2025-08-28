import 'package:flutter/material.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({super.key});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  final _formKey = GlobalKey<FormState>();
  final _emailctrl = TextEditingController();
  final _passctrl = TextEditingController();

  bool _obscure = true;
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _emailctrl.dispose();
    _passctrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final ok = _formKey.currentState?.validate() ?? false;
    if (ok) return;
  }

  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.network("https://i.ibb.co/6JFRpHwt/logo-inacap.jpg",
                height: 100,
                fit: BoxFit.contain
              ),
            
            ),
            const SizedBox(height: 16),

            const Text(
              "bienvenido inacapino",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center
            ),
            TextFormField(
              enabled: _loading,
              controller: _emailctrl,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              enableSuggestions: true,
              autofillHints: const [AutofillHints.email],
              decoration: const InputDecoration(
                labelText: "email",
                hintText: "ejemplo@inacap.cl",
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder()

            ),
            
            )
          ],

        ),
      ),
    );
  }
}

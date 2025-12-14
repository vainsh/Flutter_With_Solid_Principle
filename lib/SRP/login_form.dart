// Widget - defines external parameters
import 'package:flutter/material.dart';

abstract class WidgetView<T1, T2> extends StatelessWidget {
  final T2 state;
  T1 get widget => (state as State).widget as T1;

  const WidgetView(this.state, {super.key});

  @override
  Widget build(BuildContext context);
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormController createState() => LoginFormController();
}

// Controller - handles state and business logic only
class LoginFormController extends State<LoginForm> {
  // MainModel model;
  bool isLoading = false;
  String email = '';
  String password = '';

  @override
  void initState() {
    // model = Provider.of<MainModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _LoginFormView(this);

  // All business logic grouped together
  void handleLoginPressed() {
    setState(() => isLoading = true);
    // model.login(email, password).then((success) {
    //   setState(() => isLoading = false);
    //   if (success) Navigator.pop(context);
    // });
  }

  void handleEmailChanged(String value) => email = value;
  void handlePasswordChanged(String value) => password = value;
}

class _LoginFormView extends WidgetView<LoginForm, LoginFormController> {
  const _LoginFormView(super.state);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: state.handleEmailChanged,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          onChanged: state.handlePasswordChanged,
          decoration: InputDecoration(labelText: 'Password'),
        ),
        ElevatedButton(
          onPressed: state.handleLoginPressed,
          child: state.isLoading
              ? CircularProgressIndicator()
              : Text('Login'),
        ),
      ],
    );
  }
}


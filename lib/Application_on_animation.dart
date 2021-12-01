import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum AuthMode { SignUp, Login }

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {

    _controller=AnimationController(vsync: this,duration: Duration(milliseconds:300));
    _animation=Tween<double>(begin:1.0,end:0.0).animate(CurvedAnimation(parent:_controller,curve:Curves.easeIn));
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  final _passwordController = TextEditingController();

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          elevation: 8,
          child: AnimatedContainer(
            duration:Duration(milliseconds:400),
            height: _authMode==AuthMode.SignUp? 320:260,
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "E-Mail"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.isEmpty || !val.contains('@')) {
                          return "Invalid email!";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        _authData['email'] = val!;
                        print(_authData['email']);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Password"),
                      controller: _passwordController,
                      obscureText: true,
                      validator: (val) {
                        if (val!.isEmpty || val.length <= 5) {
                          return "Password is too short!";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        _authData['password'] = val!;
                        print(_authData['password']);
                      },
                    ),
                      AnimatedContainer(
                        duration: Duration(milliseconds:300),
                        constraints: BoxConstraints(
                          minHeight: _authMode == AuthMode.SignUp?60:0,
                          maxHeight: _authMode == AuthMode.SignUp?120:0,

                        ),
                        child: FadeTransition(
                          opacity:_animation,
                          child: TextFormField(
                            enabled: _authMode == AuthMode.SignUp,
                            decoration:
                                InputDecoration(labelText: 'Confirm Password'),
                            obscureText: true,
                            validator: _authMode == AuthMode.SignUp
                                ? (value) {
                                    if (value != _passwordController.text) {
                                      return 'Passwords do not match!';
                                    }
                                    return null;
                                  }
                                : null,
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 20
                    ),
                    RaisedButton(
                      child:
                          Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                      onPressed: _submit,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryTextTheme.button!.color,
                    ),
                    FlatButton(
                      child: Text(
                          '${_authMode == AuthMode.Login ? 'SIGN UP' : 'LOGIN'} INSTEAD'),
                      onPressed: _switchAuthMode,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    if (_authMode == AuthMode.Login) {
      // Log user in
    } else {
      // Sign user up
    }
  }
}

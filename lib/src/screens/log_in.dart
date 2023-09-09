import 'package:flutter/material.dart';

import '../../clipper/clipper_class.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isObscured = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _password;
  String? _passwordError;
  bool isChecked = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _passwordError = null;
        _password = _password;
      });
    }
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&+-])[A-Za-z\d@$!%?&+-]{8,}$')
        .hasMatch(value)) {
      return 'Invalid password format';
    }
    return null; // Password is valid
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          BuildTopClip(),
          Center(
              child: Column(children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 35,
                    color: Colors.green[600],
                  ),
                ),
                const Text(
                  "Log in to your account",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ])),
          Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0 , right: 40),
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFDEE5E0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors
                              .transparent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            )),
                        prefixIcon: const Icon(
                          Icons.person_2,
                          color: Color(0xFF1F3828),
                        ),
                        labelText: 'Full Name',
                        labelStyle:
                        const TextStyle(color: Color(0xFF1F3828), fontSize: 15),
                        hintText: 'Enter your full name',
                        hintStyle:
                        const TextStyle(color: Color(0xFF1F3828), fontSize: 15),
                      ),
                    ),
                  ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0 , right: 40),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              obscureText: !_isObscured,
                              // validator: passwordValidator,
                              // controller: _fullNameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFDEE5E0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    )),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Color(0xFF1F3828),
                                ),
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                    color: Color(0xFF1F3828), fontSize: 15),
                                hintText: 'Enter your password',
                                hintStyle: const TextStyle(
                                    color: Color(0xFF1F3828), fontSize: 15),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isObscured = !_isObscured;
                                    });
                                  },
                                  child: Icon(
                                    _isObscured
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              validator: passwordValidator,
                              onSaved: (value) {
                                _password = value;
                              },
                            ),
                            if (_passwordError != null)
                              Text(
                                _passwordError!,
                                style: const TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Row(
                children: [
                  Row(children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.8, // Adjust the scale factor as needed
                          child: Checkbox(
                            value: isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue ?? false;
                              });
                            },
                            activeColor: isChecked ? Colors.green : Colors.white, // Color when checked
                            checkColor: isChecked ? Colors.white : Colors.white, // Color of the checkmark (usually white)
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "Remember me",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(200, 1, 20, 5),
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: const Text("Forgot Password",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Colors.green
                          ),),
                      ),
                    )
                  ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0 , left: 10),
                child: Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF43A047),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100, // Horizontal padding
                        vertical: 20, // Vertical padding
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(50), // Button shape
                      ),
                    ),
                    child: const Text('Log in'),
                  ),
                ),
              ),
            ],
          )
        ]));
  }
}

ClipPath BuildTopClip() {
  return ClipPath(
      clipper: BezierClipper(),
      child: Container(
        height: 270,
        width: 600,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/plant-phone-1q0zq58ckhs6g7hn.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF2B3783), width: 0.5),
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
              ], // border:
            ),
            height: 30,
            width: 40,
            child: const Padding(
              padding: EdgeInsets.only(left: 9.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black45,
              ),
            ),
          ),
        ),
      ));
}

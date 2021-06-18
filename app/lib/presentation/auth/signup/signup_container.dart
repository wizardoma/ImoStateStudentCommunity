import 'package:app/presentation/auth/form_bottom_sheet.dart';
import 'package:app/presentation/widgets/text_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _schools = <String,String>{
    "futo": "Federal University of Technology, Owerri",
    "imsu": "Imo State University",
    "palm" :"Eastern Palm University",
  };

  final _levels = [
    "Jupeg",
    "Predegree",
    "Post graduate",
    ...List.generate(7, (index) => "${index+1}00L")
  ];

  var _selectedUniversity = "Select university";
  var _selectedLevel = "Select your level";

  void _signUp(){

  }

  TextEditingController _nameController;
  TextEditingController _departmentController;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _departmentController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBottomSheet(
      title: "Sign up",
      onButtonPressed: () => print("pressed login"),
      form: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          TextInputField(
            textEditingController: _nameController,
            title: "Name",
            placeholder: "What would you like to be called?",
          ),
          TextInputField(
            textEditingController: _passwordController,
            title: "Email",
            placeholder: "Your email",
          ),
          TextInputField(
            textEditingController: _passwordController,
            title: "Password",
            isPassword: true,
            placeholder: "Your password",
          ),
          Container(
            padding: EdgeInsets.all(5),

            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
                width: 0.5
              )
            ),
            child: DropdownButton(
              isExpanded: true,
              iconSize: 30,
              underline: SizedBox(),
              iconEnabledColor: Theme.of(context).primaryColor,

              hint: Text(_selectedUniversity),
              onChanged: (s){
                setState(() {
                  _selectedUniversity = _schools["$s"];
                });
              },
              items: _schools.keys.map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(_schools["$e"]),
                ),
              ).toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(5),

            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey.shade300,
                    width: 0.5
                )
            ),
            child: DropdownButton(
              isExpanded: true,
              iconSize: 30,
              underline: SizedBox(),
              iconEnabledColor: Theme.of(context).primaryColor,

              hint: Text(_selectedLevel),
              onChanged: (s){
                setState(() {
                  _selectedLevel = s.toString();
                });
              },
              items: _levels.map(
                    (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              ).toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextInputField(
            textEditingController: _departmentController,
            title: "Department",
            isPassword: false,
            placeholder: "Your department",
          ),
          Text(
            "By continuing, you indicate that you agree to MySchool's Terms of Services and Privacy Policy?",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

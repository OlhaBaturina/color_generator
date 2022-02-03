import 'package:color_generator/color_generator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _mainColor = Colors.white;
  Color _secondaryColor = Colors.black;

  String _userName = '';
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: _secondaryColor,
        title:  Text('Tap on screen', style: TextStyle(color: _mainColor)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => changeColor(),
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 22, end: 22),
              width: double.infinity,
              height: double.infinity,
              color: _mainColor,
              child: Center(
                child: Text(
                  _userName != ''
                  ? 'Nice to meet you $_userName!'
                  : 'Hey there', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _secondaryColor, 
                    fontSize: 34, 
                    fontWeight: FontWeight.w700
                  )
                )
              ),
            ),
          ),
          PositionedDirectional(
            start: 22,
            top: MediaQuery.of(context).padding.top + AppBar().preferredSize.height + 22,
            end: 22,
            child: _buildNameInput()
          ),
        ],
      )
    );
  }

  Widget _buildNameInput(){
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: _secondaryColor.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 6
          )
        ]
      ),
      child: TextField(
        style: TextStyle(color: _mainColor),
        maxLines: 1,
        controller: _nameController,
        textInputAction: TextInputAction.done,
        cursorColor: _mainColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          hintText: "What's your name?",
          hintStyle: TextStyle(color: _secondaryColor.withOpacity(0.5)),
          filled: true,
          fillColor: _secondaryColor.withOpacity(0.2),
          prefixIcon: Icon(
            Icons.person_add_alt_sharp, 
            color: _mainColor, 
            size: 30,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: _mainColor),
            borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _secondaryColor),
            borderRadius: BorderRadius.circular(8)
          ),
        ),
        onSubmitted: (name) {
          _userName = name.trim();
          _nameController.clear();
        },
      ),
    );
  }

  void changeColor() {
    setState(() {
      _mainColor = ColorGenerator.getColor();
      if(_mainColor.red >= 200 || 
        _mainColor.blue >= 200 || 
        _mainColor.green >= 200
      ) {
        _secondaryColor = Colors.black;
      } else {
        _secondaryColor = Colors.white;
      }
    });
  }
}
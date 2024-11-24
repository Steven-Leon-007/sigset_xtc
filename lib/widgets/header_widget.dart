import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key, this.isLoginPage = false});

  final bool isLoginPage;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 217, 217, 217),
      child: Row(
        mainAxisAlignment: widget.isLoginPage
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Image.asset(
              "assets/xtreme_logo.png",
              height: MediaQuery.of(context).size.height * 0.10,
              width: widget.isLoginPage
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          if (!widget.isLoginPage)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.3,
              child: IconButton(
                icon: Image.asset("assets/bell_icon.png"),
                iconSize: 24,
                onPressed: () {},
              ),
            ),
        ],
      ),
    );
  }
}

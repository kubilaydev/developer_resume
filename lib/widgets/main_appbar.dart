import 'package:flutter/material.dart';

///
class MainAppBar extends StatefulWidget {
  ///
  MainAppBar(
      {required this.title,
      required this.func,
      required this.isShowGallery,
      Key? key})
      : super(key: key);

  ///
  final String title;

  ///
  bool isShowGallery = false;

  ///
  final VoidCallback func;

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  ///

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0XFF1D1F20),
        actions: [
          if (widget.isShowGallery)
            TextButton(
              onPressed: () {
                setState(() {
                  // widget.function();
                  widget.func();
                  widget.isShowGallery = !widget.isShowGallery;
                });
                print("appbar Fucn in");
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  "Close",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18),
                ),
              ),
            )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 60, // Don't show the leading button
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ));
  }
}

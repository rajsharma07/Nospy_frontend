import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nospy/nospy.dart';

void main() { 
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NoSpy(),
      )
    );
}

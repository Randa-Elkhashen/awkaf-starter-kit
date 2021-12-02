import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/widgets/loaders/files_loader.dart';
class FilesLoaderScreen extends StatefulWidget {
  const FilesLoaderScreen({Key? key}) : super(key: key);

  @override
  State<FilesLoaderScreen> createState() => _FilesLoaderScreenState();
}

class _FilesLoaderScreenState extends State<FilesLoaderScreen> {

  final List<String> _urls = [
    "https://unsplash.com/photos/ZdlyyLm9hgY/download?force=true&w=2400",
    "https://unsplash.com/photos/KYBy7FfU0X0/download?force=true&w=2400",
    "https://unsplash.com/photos/6s1kQJcRjR0/download?force=true&w=2400"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FilesLoader(
        urls: _urls,
        onLoad: (filePaths){
          return ListView.builder(
            itemCount: filePaths.length,
            itemBuilder: (context,index){
              String _url = filePaths[index];
              return Image.file(File(_url));
            },
          );
        },
      ),
    );
  }
}

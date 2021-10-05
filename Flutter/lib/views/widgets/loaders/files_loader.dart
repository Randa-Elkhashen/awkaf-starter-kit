import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/managers/files_loader_manager.dart';
import 'package:flutter_app/views/widgets/loaders/failed_loading.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
class FilesLoader extends StatefulWidget {
  final List<String> urls;
  final Widget Function(List<String>) onLoad;
  const FilesLoader({
    Key? key,
    required this.urls,
    required this.onLoad,
  }) : super(key: key);

  @override
  _FilesLoaderState createState() => _FilesLoaderState();
}

class _FilesLoaderState extends State<FilesLoader> {

  late FilesLoaderManager _loader;

  @override
  void initState() {
    DefaultCacheManager().emptyCache();
    _loader = FilesLoaderManager(widget.urls);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: _loader.stream,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        } else if(snapshot.connectionState == ConnectionState.done){
          return widget.onLoad(_loader.filePaths);
        }else if(snapshot.hasError){
          return FailedLoading(
            message: "Failed to load data :(",
            onReload: (){
              _loader = FilesLoaderManager(widget.urls);
            },
          );
        } else{
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ((snapshot.data ?? 0.0) * 100).toStringAsFixed(0)+"%",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  LinearProgressIndicator(
                    value: snapshot.data,
                  ),
                ],
              ),
            ),
          );
        }
      }
    );
  }
}

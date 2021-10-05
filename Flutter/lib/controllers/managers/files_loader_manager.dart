import 'dart:async';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FilesLoaderManager{

  /// control the load process
  /// by provide one stream listen to all loading processes
  ///
  /// value of progress provided in %100 (min: %0 & max: %100).
  final _streamController = StreamController<double>();

  /// total load progress
  /// progress not %100 but double value like 1.0,2.0,3.0 and so on
  late double _totalProgress;

  /// current file index being loaded
  int _currentFileIndex = 0;

  /// current load progress
  double _currentProgress = 0.0;

  /// files urls
  late List<String> _urls;

  /// files paths - empty if failed to load
  late List<String> filePaths = [];

  /// return current progress on present format
  get _progressAsPresent => _currentProgress/_totalProgress;

  /// create new stream used to listen to all process progress
  Stream<double> get stream => _streamController.stream;

  FilesLoaderManager(List<String> urls){
    _totalProgress = urls.length.toDouble();
    _urls = urls;
    _startGetFiles();
  }

  _startGetFiles(){
    final _stream = DefaultCacheManager()
        .getFileStream(_urls[_currentFileIndex],withProgress: true);
    _stream.listen(
        (event) {
          if(event is DownloadProgress){
            _currentProgress = (event.progress ?? 0) + _currentFileIndex;
            _streamController.sink.add(_progressAsPresent);
          } else if(event is FileInfo){
            filePaths.add(event.file.path);
          }
        },
        onDone: (){
          _currentFileIndex++;
          if(_currentFileIndex < _urls.length){
            _startGetFiles();
          }else{
            _streamController.close();
          }
        },
        cancelOnError: true,
        onError:(error){
          _streamController.close();
        }
    );
  }
}
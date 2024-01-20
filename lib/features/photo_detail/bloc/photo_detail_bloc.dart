import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:meta/meta.dart';

part 'photo_detail_event.dart';
part 'photo_detail_state.dart';

class PhotoDetailBloc extends Bloc<PhotoDetailEvent, PhotoDetailState> {
  PhotoDetailBloc() : super(PhotoDetailInitial()) {
    on<PhotoDownloadClickedEvent>(photoDownloadClickedEvent);
  }

  FutureOr<void> photoDownloadClickedEvent(
      PhotoDownloadClickedEvent event, Emitter<PhotoDetailState> emit) async {
    emit(PhotoDownloadingState());
    try {
      FileDownloader.downloadFile(
        url: event.downloadUrl,
        name: 'event.downloadUrl.length.jpg',
        onDownloadCompleted: (String path) {
          print('FILE DOWNLOADED TO PATH: $path');
        },
        // onDownloadError: (String error) {
        //   print('DOWNLOAD ERROR: $error');
        // }
      );
      emit(PhotoDownloadedState());
    } on PlatformException catch (error) {
      print(error);
    }
  }
}

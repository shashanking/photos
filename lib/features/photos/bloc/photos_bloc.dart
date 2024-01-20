import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:photos/features/photos/models/photo_data_model.dart';
import 'package:photos/features/photos/repos/photos_repo.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosInitial()) {
    on<PhotosInitialFetchEvent>(photosInitialFetchEvent);
    on<PhotoClickedEvent>(photoClickedEvent);
  }

  FutureOr<void> photosInitialFetchEvent(
      PhotosInitialFetchEvent event, Emitter<PhotosState> emit) async {
    emit(PhotosLoadingState());
    try {
      List<PhotosDataModel> photos = await PhotosRepo.fetchPosts();
      emit(PhotosFetchingSuccessful(photos: photos));
    } catch (e) {
      emit(PhotosErrorState());
      print(e.toString());
    }
  }

  FutureOr<void> photoClickedEvent(
      PhotoClickedEvent event, Emitter<PhotosState> emit) {
    emit(PhotoClickedState(photo: event.photo));
  }
}

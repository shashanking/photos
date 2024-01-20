// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'photos_bloc.dart';

@immutable
sealed class PhotosState {}

abstract class PhotosActionState extends PhotosState {}

final class PhotosInitial extends PhotosState {}

class PhotosLoadingState extends PhotosState {}

class PhotosErrorState extends PhotosState {}

class PhotoClickedState extends PhotosState {
  final PhotosDataModel photo;
  PhotoClickedState({
    required this.photo,
  });
}

class PhotosFetchingSuccessful extends PhotosState {
  final List<PhotosDataModel> photos;
  PhotosFetchingSuccessful({
    required this.photos,
  });
}

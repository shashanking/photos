// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'photos_bloc.dart';

@immutable
sealed class PhotosEvent {}

abstract class PhotoActionEvent {}

class PhotosInitialFetchEvent extends PhotosEvent {}

class PhotoClickedEvent extends PhotosEvent {
  final PhotosDataModel photo;
  PhotoClickedEvent({
    required this.photo,
  });
}

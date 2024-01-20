part of 'photo_detail_bloc.dart';

@immutable
sealed class PhotoDetailState {}

final class PhotoDetailInitial extends PhotoDetailState {}

class PhotoDownloadingState extends PhotoDetailState {}

class PhotoDownloadedState extends PhotoDetailState {}

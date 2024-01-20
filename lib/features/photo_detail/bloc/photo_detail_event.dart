part of 'photo_detail_bloc.dart';

@immutable
sealed class PhotoDetailEvent {}

class PhotoDownloadClickedEvent extends PhotoDetailEvent {
  final String downloadUrl;
  PhotoDownloadClickedEvent({
    required this.downloadUrl,
  });
}

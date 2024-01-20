import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos/features/photo_detail/bloc/photo_detail_bloc.dart';
import 'package:photos/features/photos/models/photo_data_model.dart';

class PhotoDetailPage extends StatefulWidget {
  final PhotosDataModel model;
  const PhotoDetailPage({required this.model, super.key});

  @override
  State<PhotoDetailPage> createState() => _PhotoDetailPageState();
}

class _PhotoDetailPageState extends State<PhotoDetailPage> {
  final PhotoDetailBloc bloc = PhotoDetailBloc();
  @override
  Widget build(BuildContext context) {
    final photoDetails = widget.model;
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Details')),
      body: BlocConsumer<PhotoDetailBloc, PhotoDetailState>(
        bloc: bloc,
        // listenWhen: (previous, current) => current is! PhotoDetailInitial,
        listener: (context, state) {
          // if (state is PhotoDownloadingState) {
          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //     content: Text('downloading'),
          //     duration: Duration(seconds: 2),
          //   ));
          // }
          if (state is PhotoDownloadedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('downloaded'),
              duration: Duration(seconds: 2),
            ));
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(32),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.network(
                photoDetails.urlRegular,
                fit: BoxFit.contain,
                width: width,
                height: 200,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.heart_broken),
                  Text(photoDetails.likes.toString()),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Author: '),
                  Expanded(child: Text(photoDetails.authorName ?? "no author")),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Author Link: '),
                  Expanded(
                      child:
                          Text(photoDetails.authorPortfolioUrl ?? "no author")),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Short Desc: '),
                  Expanded(child: Text(photoDetails.altDescription)),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: '),
                  Expanded(child: Text(photoDetails.description)),
                ],
              ),
            ]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(PhotoDownloadClickedEvent(
              downloadUrl: photoDetails.urlFull ?? ""));
        },
        child: Icon(Icons.download),
      ),
    );
  }
}

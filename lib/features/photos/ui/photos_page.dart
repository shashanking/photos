import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos/features/photos/bloc/photos_bloc.dart';

import '../../photo_detail/ui/photo_detail_page.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  final PhotosBloc bloc = PhotosBloc();

  @override
  void initState() {
    bloc.add(PhotosInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos"),
      ),
      body: BlocConsumer<PhotosBloc, PhotosState>(
        bloc: bloc,
        listenWhen: (previous, current) => current is PhotoClickedState,
        buildWhen: (previous, current) => current is! PhotoClickedState,
        listener: (context, state) {
          if (state is PhotoClickedState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhotoDetailPage(
                        model: state.photo,
                      )),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case PhotosFetchingSuccessful:
              final successState = state as PhotosFetchingSuccessful;
              print('-----${successState.photos.length}');
              return Container(
                child: ListView.builder(
                    itemCount: successState.photos.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => bloc.add(PhotoClickedEvent(
                            photo: successState.photos[index])),
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade700)),
                          // height: 250,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  successState.photos[index].urlRegular,
                                  fit: BoxFit.contain,
                                  height: 180,
                                  width: 200,
                                ),
                                Text(
                                    successState.photos[index].altDescription ??
                                        "no data"),
                              ]),
                        ),
                      );
                    }),
              );
            case PhotosLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PhotosErrorState:
              return const Center(
                child: Text("Loading Failed :( "),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

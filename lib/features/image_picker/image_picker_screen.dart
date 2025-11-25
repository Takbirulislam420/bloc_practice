import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_with_bloc/bloc/image/imagepicker_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image picker")),
      body: Center(
        child: BlocBuilder<ImagepickerBloc, ImagepickerState>(
          builder: (context, state) {
            if (state.file == null) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<ImagepickerBloc>().add(CameraCapture());
                    },
                    child: CircleAvatar(child: Icon(Icons.camera)),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                      context.read<ImagepickerBloc>().add(GalleryImagePicker());
                    },
                    child: CircleAvatar(child: Icon(Icons.image)),
                  ),
                ],
              );
            } else {
              return Image.file(File(state.file!.path.toString()));
            }
          },
        ),
      ),
    );
  }
}

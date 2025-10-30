import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracing_time/business_logic/state/request_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestInitialState(isRefresh: false));

  List listRequestData = [];

  File? file;
  Uint8List? fileBytes;
  String? date;
  double? sizeInKB;
  String? fileName;
  bool isLoading = false;
  String? downloadUrl;

  void changeState() {
    final currentState = state;
    if (currentState is RequestInitialState) {
      final current = currentState.isRefresh;
      emit(RequestInitialState(isRefresh: !current));
    }
    setLoading(true);
  }

  void setLoading(bool value) {
    emit(RequestInitialState(isRefresh: value));
  }

  void addRequest(
    BuildContext context,
    String requestType,
    String requestDescription,
    String startDate,
    String endDate,
    bool allDay,
    String startTime,
    String endTime,
  ) {
    emit(RequestLoadingState());
    FirebaseFirestore.instance
        .collection('request')
        .add({
          'requestType': requestType,
          'requestDescription': requestDescription,
          'startDate': startDate,
          'endDate': endDate,
          'allDay': allDay,
          'startTime': startTime,
          "endTime": endTime,
          "attachment": downloadUrl,
        })
        .then((value) {
          emit(RequestLoadedState(listRequestData: listRequestData));
          getRequestData();
          downloadUrl = null;
        })
        .catchError((error) {
          emit(RequestFailureState(errorMessage: error.toString()));
        });
  }

  void getRequestData() async {
    emit(RequestLoadingState());
    await FirebaseFirestore.instance
        .collection('request')
        .get()
        .then((value) {
          listRequestData = value.docs.map((doc) {
            final data = doc.data();
            data['id'] = doc.id;
            return data;
          }).toList();
        })
        .catchError((error) {
          emit(RequestFailureState(errorMessage: error.toString()));
        });
    emit(RequestLoadedState(listRequestData: listRequestData));
    if (listRequestData.isEmpty) return;
  }

  Future<void> chooseImage(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result == null) {
      if (kDebugMode) {
        print("❌ no image selected");
      }
      return;
    }
    if (!context.mounted) return;
    Navigator.pop(context);
    isLoading = true;
    changeState();
    // تحديد الاسم
    fileName = path.basename(result.files.single.name);
    sizeInKB = result.files.single.size / 1024;
    file = File(fileName!);

    final Reference ref = FirebaseStorage.instance.ref().child(
      "requestImage/$fileName",
    );

    try {
      if (kIsWeb) {
        // ✅ الرفع على الويب
        fileBytes = result.files.single.bytes!;
        await ref.putData(fileBytes!);
      } else {
        // ✅ الرفع على Android / iOS
        file = File(result.files.single.path!);
        await ref.putFile(file!);
      }

      downloadUrl = await ref.getDownloadURL();
      // Future.delayed(const Duration(seconds: 4), () {
      if (!context.mounted) return;
      isLoading = false;
      changeState();
      // });

      if (kDebugMode) {
        print("✅ Uploaded successfully: $downloadUrl");
      }
    } catch (e) {
      if (kDebugMode) {
        print("⚠️ Upload error: $e");
      }
    }
  }
}

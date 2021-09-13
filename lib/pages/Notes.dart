import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  
    final String _fileUrl = "https://docs.google.com/spreadsheets/d/1ind2YoivGi4BEuUs4YHbFIB325UbbLq94H6ymu-Q_bI/edit#gid=0";
  final String _fileName = "DSCF0277.jpg";
  final Dio _dio = Dio();

  String _progress = "-";

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  get path => null;

  @override
  void initState() {
    super.initState();

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
   final initSettings = InitializationSettings(android: android, iOS: iOS);

   //flutterLocalNotificationsPlugin.initialize(initSettings, onSelectNotification: _onSelectNotification);
  }
  
  Future<dynamic> _onSelectNotification(String json) async {
    final obj = jsonDecode(json);

    if (obj['isSuccess']) {
      OpenFile.open(obj['filePath']);
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('${obj['error']}'),
        ),
      );
    }
  }

  Future<void> _showNotification(Map<String, dynamic> downloadStatus) async {
    final android = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      // priority: Priority.High,
      // importance: Importance.Max
    );
    final iOS = IOSNotificationDetails();
    final platform = NotificationDetails(android: android, iOS: iOS);
    final json = jsonEncode(downloadStatus);
    final isSuccess = downloadStatus['isSuccess'];

    await flutterLocalNotificationsPlugin.show(
      0, // notification id
      isSuccess ? 'Success' : 'Failure',
      isSuccess ? 'File has been downloaded successfully!' : 'There was an error while downloading the file.',
      platform,
      payload: json
    );
  }

  Future<Directory?> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      return await DownloadsPathProvider.downloadsDirectory;
    }

    // in this example we are using only Android and iOS so I can assume
    // that you are not trying it for other platforms and the if statement
    // for iOS is unnecessary
  
    // iOS directory visible to user
    return await getApplicationDocumentsDirectory();
  }

  Future<bool> _requestPermissions() async {
    var permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

    if (permission != PermissionStatus.granted) {
      await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    }

    return permission == PermissionStatus.granted;
  }

  void _onReceiveProgress(int received, int total) {
    if (total != -1) {
      setState(() {
        _progress = (received / total * 100).toStringAsFixed(0) + "%";
      });
    }
  }

  Future<void> _startDownload(String savePath) async {
    Map<String, dynamic> result = {
      'isSuccess': false,
      'filePath': null,
      'error': null,
    };

    try {
      final response = await _dio.download(
        _fileUrl,
        savePath,
        onReceiveProgress: _onReceiveProgress
      );
      result['isSuccess'] = response.statusCode == 200;
      result['filePath'] = savePath;
    } catch (ex) {
      result['error'] = ex.toString();
    } finally {
      await _showNotification(result);
    }
  }

  Future<void> _download() async {
    final dir = await _getDownloadDirectory();
    final isPermissionStatusGranted = await _requestPermissions();

    if (isPermissionStatusGranted) {
      final savePath = path.join(dir!.path, _fileName);
      await _startDownload(savePath);
    } else {
      // handle the scenario when user declines the permissions
    }
  }
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTES"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Download progress:',
            ),
            Text(
              '$_progress',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _download,
        tooltip: 'Download',
        child: Icon(Icons.file_download),
      ),
    );
  }
}

class PermissionGroup {
  static var storage;
}

class PermissionHandler {
  requestPermissions(List list) {}

  checkPermissionStatus(storage) {}
}

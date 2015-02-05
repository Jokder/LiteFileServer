part of server;

class WebServer {
  void startServer() {
    StreamServer webServer = new StreamServer(homeDir:Configuration.ROOT, uriMapping:mapping);
    webServer.start(port:Configuration.PORT);
  }

  void onError(HttpConnect connect, error, [stackTrace]) {
    connect.response
      ..headers.contentType = ContentType.TEXT
      ..write("服务器出现故障");
  }

  static Map mapping = {
      "/files":getFiles
  };

  static void getFiles(HttpConnect connect) {
    try {
      Directory dir = new Directory(Configuration.ROOT + '/files');
      Collection<File> fileInfoList = new Collection<File>(dir.listSync(recursive:true))
      .where((f) => !FileSystemEntity.isDirectorySync(f.path))
      .orderByDescending((f) => f.lastModifiedSync())
      .toCollection();
      List files = new List();
      fileInfoList.items.forEach((fInfo) {
        if (!(FileSystemEntity.isLinkSync(fInfo.path) || FileSystemEntity.isDirectorySync(fInfo.path))) {
          int flen = fInfo.lengthSync();
          String len_h = "";
          if (flen < pow(1024, 1)) {
            len_h = (flen / pow(1024, 0)).toStringAsFixed(2) + "B";
          } else if (flen >= pow(1024, 1) && flen < pow(1024, 2)) {
            len_h = (flen / pow(1024, 1)).toStringAsFixed(2) + "KB";
          } else if (flen >= pow(1024, 2) && flen < pow(1024, 3)) {
            len_h = (flen / pow(1024, 2)).toStringAsFixed(2) + "MB";
          } else {
            len_h = (flen / pow(1024, 3)).toStringAsFixed(2) + "GB";
          }
          files.add({
              "path":fInfo.path.replaceAll('\\', '/').substring(Configuration.ROOT.length+1),
              "length":len_h,
              "lastModified":fInfo.lastModifiedSync()
          });
        }
      });
      connect.response
        ..headers.contentType = ContentType.JSON
        ..write(encode(files));
    }
    catch (e) {
      int i = 0;
    }
  }
}
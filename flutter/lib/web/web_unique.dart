import 'dart:async';
import 'dart:convert';
import 'dart:js_util' as js_util;

Future<void> webselectFiles({required bool is_folder}) async {
  return Future(() =>
      js_util.callMethod(js_util.globalThis, 'setByName', ['select_files', is_folder]));
}

Future<void> webSendLocalFiles(
    {required int handleIndex,
    required int actId,
    required String path,
    required String to,
    required int fileNum,
    required bool includeHidden,
    required bool isRemote}) {
  return Future(() => js_util.callMethod(js_util.globalThis, 'setByName', [
        'send_local_files',
        jsonEncode({
          'id': actId,
          'handle_index': handleIndex,
          'path': path,
          'to': to,
          'file_num': fileNum,
          'include_hidden': includeHidden,
          'is_remote': isRemote,
        })
      ]));
}

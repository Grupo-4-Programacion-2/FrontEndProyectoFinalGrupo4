import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../environment/environment.dart';
import '../models/user.dart';
import 'package:pm2_pf_grupo_4/src/models/remembers.dart';


class RememberProvider extends GetConnect {
  //String url = '${Environment.API_URL}api/users';

  User userSession = User.fromJson(GetStorage().read('user') ?? {});

  Future<Stream> registerRemember(Remembers remembers, File image) async {
    Uri uri = Uri.http(Environment.API_URL_OLD, '/api/records/create');
    print('URL ---> $uri');
    final request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = userSession.sessionToken ?? '';
    request.files.add(http.MultipartFile(
        'image',
        http.ByteStream(image.openRead().cast()),
        await image.length(),
        filename: basename(image.path)
    ));
    request.fields['remembers'] = json.encode(remembers);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

}
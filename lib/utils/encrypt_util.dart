import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:treina_pass/utils/secure_storage_util.dart';


class EncryptUtil {
  SecureStorageUtil ss;

  String encryptString(String item) {
    String senhaUsuario;
    ss.getData('senha').then((value) {
      senhaUsuario = value;
      print(senhaUsuario);
    });

    final encoded = utf8.encode(senhaUsuario.toString());
    var digest = md5.convert(encoded);
    final key = Key.fromUtf8(digest.toString());
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(item, iv: iv);
    return encrypted.base64;
  }

  String decryptString(String item){

  }
}
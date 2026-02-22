
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

abstract class StorageService {
  Future<String> uploadImage(File image);
}

class SupaStorage implements StorageService {
  @override
  Future<String> uploadImage(File image) async {
   
    // await Supabase.instance.client.auth.refreshSession();

    final timeStamp = DateTime.now().microsecondsSinceEpoch.toString();
    final uniquePath = '${timeStamp}_${image.path.split('/').last}';
    await Supabase.instance.client.storage
        .from('fruits_Image')
        .upload(uniquePath, image);
    final imageUrl =  Supabase.instance.client.storage
        .from('fruits_Image')
        .getPublicUrl(uniquePath);
    return imageUrl;
  }
}

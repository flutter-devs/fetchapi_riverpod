import 'package:fetchapi_riverpod/model/photos.dart';
import 'package:fetchapi_riverpod/services/fetch_api.dart';
import 'package:flutter_riverpod/all.dart';

final photostateFuture = FutureProvider<List<PhotoModel>>((ref) async {
  return fetchPhotos();
});

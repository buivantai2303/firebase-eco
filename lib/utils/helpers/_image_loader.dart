// import 'dart:async';
//
// import 'dart:ui' as ui;
//
// import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
// import 'package:flutter/material.dart';
//
// import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart'
//     as platform show ImageLoader;
// import 'package:flutter_cache_manager/src/cache_managers/base_cache_manager.dart';
//
// class ImageLoader implements platform.ImageLoader {
//   @override
//   Stream<ui.Codec> loadBufferAsync(
//       String url,
//       String? cacheKey,
//       StreamController<ImageChunkEvent> chunkEvents,
//       DecoderBufferCallback decode,
//       BaseCacheManager cacheManager,
//       int? maxHeight,
//       int? maxWidth,
//       Map<String, String>? headers,
//       ImageRenderMethodForWeb imageRenderMethodForWeb,
//       VoidCallback evictImage) {
//     return _load(url, cacheKey, chunkEvents, decode, cacheManager, maxHeight,
//         maxWidth, headers, imageRenderMethodForWeb, evictImage);
//   }
//
//   @override
//   Stream<ui.Codec> loadImageAsync(
//       String url,
//       String? cacheKey,
//       StreamController<ImageChunkEvent> chunkEvents,
//       ImageDecoderCallback decode,
//       BaseCacheManager cacheManager,
//       int? maxHeight,
//       int? maxWidth,
//       Map<String, String>? headers,
//       ImageRenderMethodForWeb imageRenderMethodForWeb,
//       VoidCallback evictImage) {
//     // TODO: implement loadImageAsync
//     throw UnimplementedError();
//   }
// }

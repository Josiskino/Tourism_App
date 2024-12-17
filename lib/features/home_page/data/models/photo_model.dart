import '../../../../core/constants/api_constant.dart';
import '../../domain/entities/photo.dart';

class PhotoModel extends Photo {
  PhotoModel({
    required super.id,
    required super.url,
    required super.isMain,
    required super.status,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      url: ApiConstant.host + json['url'],
      isMain: json['is_main'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'is_main': isMain,
      'status': status,
    };
  }
}

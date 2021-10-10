part of 'models.dart';

class ApiReturnValue<T> {
  final T? value;
  final String? message;
  final String? videoFile;
  final String? videoThumbnail;
  final String? videoFileTalent;
  final String? videoThumbnailTalent;

  ApiReturnValue(
      {this.message,
      this.value,
      this.videoFile,
      this.videoThumbnail,
      this.videoFileTalent,
      this.videoThumbnailTalent});
}

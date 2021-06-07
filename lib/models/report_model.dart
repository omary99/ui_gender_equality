class ReportModel {
  final int id;
  final String mediaType;
  final List<String> media;
  final String caption;

  ReportModel(
      {required this.id,
      required this.media,
      required this.mediaType,
      required this.caption});
}

List<ReportModel> mediaSamplesData = [
  ReportModel(
    id: 1,
    caption: 'hello how are you',
    media: ['https://picsum.photos/200/300'],
    mediaType: 'image',
  ),
  ReportModel(
    id: 2,
    caption: 'hello how are you',
    media: ['https://picsum.photos/200/300'],
    mediaType: 'audio',
  ),
  ReportModel(
    id: 5,
    caption: 'hello how are you sjakl',
    media: ['https://picsum.photos/200/300'],
    mediaType: 'text',
  ),
  ReportModel(
    id: 3,
    caption: 'hello how are you',
    media: ['https://picsum.photos/200/300'],
    mediaType: 'video',
  ),
  ReportModel(
    id: 4,
    caption:
        'hello how are you sjakl lask aska kslaks oaskla cjka slas lask sklas lkasl',
    media: ['https://picsum.photos/200/300'],
    mediaType: 'text',
  ),
];

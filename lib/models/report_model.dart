class ReportModel {
  final int id;
  final double latitude;
  final double longitude;
  final String mediaType;
  final List<dynamic> media;
  final String caption;

  ReportModel( 
      {required this.id,
      required this.latitude, 
      required this.longitude,
      required this.media,
      required this.mediaType,
      required this.caption});

  ReportModel.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['media'] != null),
        assert(map['caption'] != null),
        id = map['id'],
        latitude= double.parse(map['latitude'].toString()),
        longitude= double.parse(map['longitude'].toString()),
        media = map['media'],
        mediaType = map['media_type'],
        caption = map['caption'];
  
}

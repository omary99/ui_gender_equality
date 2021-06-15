class PostModel {
  final int id;
  final String? avatar;
  final String authorName;
  final String title;
  final String content;
  final String? image;

  PostModel(
      {required this.id,
      required this.authorName,
      required this.title,
      required this.avatar,
      required this.content,
       this.image});

  PostModel.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['title'] != null),
        assert(map['content'] != null),
        id = map['id'],
        authorName = map['author_name'],
        title = map['title'],
        avatar = map['avatar'],
        content = map['content'],
        image = map['image'];
}

// List<PostModel> samplePostsData = [
// PostModel(
//     id: 1,
//     authorName: 'faith',
//     title: 'Gender Equality',
//     content: 'anyimwa chakula na mkewe eyuxkncncdeoeolcm trfbc  v,bkghfdfcs',
//     image: 'https://picsum.photos/seed/picsum/200/300',
//     avatar: 'https://picsum.photos/seed/picsum/200/300'),
//   PostModel(
//       id: 2,
//       authorName: 'sophie',
//       avatar: 'https://picsum.photos/seed/picsum/200/300',
//       title: 'Gender Abuse',
//       content: 'apigwa hadi kufa eyuxkncncdeoeolcm trfbc  v,bkghfdfcs',
//       image: 'https://picsum.photos/200/300/?blur'),
//   PostModel(
//       id: 3,
//       authorName: 'libe',
//       avatar: 'https://picsum.photos/seed/picsum/200/300',
//       title: 'post Equality',
//       content: 'anyimwa chakula eyuxkncncdeoeolcm trfbc  v,bkghfdfcs na mkewe',
//       image: 'https://picsum.photos/200/300?grayscale'),
//   PostModel(
//       id: 4,
//       authorName: 'vicky',
//       title: 'love Equality',
//       avatar: 'https://picsum.photos/seed/picsum/200/300',
//       content: 'anyimwa chakula eyuxkncncdeoeolcm trfbc  v,bkghfdfcs na mkewe',
//       image: 'https://picsum.photos/200/300'),
//   PostModel(
//       id: 5,
//       authorName: 'roby',
//       avatar: 'https://picsum.photos/seed/picsum/200/300',
//       title: 'Gender imbalance',
//       content: 'anyimwa soda eyuxkncncdeoeolcm trfbc  v,bkghfdfcs na mkewe',
//       image: 'https://picsum.photos/id/237/200/300')
// ];

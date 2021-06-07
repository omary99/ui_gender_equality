class MessageModel {
  final int id;
  final String text;
  final bool isSentByMe;

  MessageModel( {required this.isSentByMe,required this.id, required this.text});
}

List<MessageModel> sampleMessagesData = [
  MessageModel(text: 'erdtfyuhijoklp; ertyuuu yuippi fghj sert rtrt', id: 1, isSentByMe: true),
  MessageModel(text: 'erdtfyuhijoklp; ertyuuu', id: 2, isSentByMe: false),
  MessageModel(text: 'erdtfyuhijoklp; ertyuuu', id: 3, isSentByMe: true),
  MessageModel(text: 'erdtfyuhijoklp; ertyuuu', id: 4, isSentByMe: false),
];

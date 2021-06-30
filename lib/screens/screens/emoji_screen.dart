import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class EmojiScreen extends StatefulWidget {
  const EmojiScreen({Key? key}) : super(key: key);

  @override
  _EmojiScreenState createState() => _EmojiScreenState();
}

class _EmojiScreenState extends State<EmojiScreen> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;

  _onEmojiSelected(Emoji emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Container(
              height: 66.0,
              color: Colors.teal,
              child: Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          emojiShowing = !emojiShowing;
                        });
                      },
                      icon: const Icon(
                        Icons.emoji_emotions,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                          controller: _controller,
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.black87),
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                                left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          )),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                        onPressed: () {
                          // send message
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  )
                ],
              )),
          Offstage(
            offstage: !emojiShowing,
            child: SizedBox(
              height: 250,
              child: EmojiPicker(
                  onEmojiSelected: (Category category, Emoji emoji) {
                    _onEmojiSelected(emoji);
                  },
                  onBackspacePressed: _onBackspacePressed,
                  config: const Config(
                      columns: 7,
                      emojiSizeMax: 32.0,
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      initCategory: Category.RECENT,
                      bgColor: Color(0xFFF2F2F2),
                      indicatorColor: Colors.teal,
                      iconColor: Colors.grey,
                      iconColorSelected: Colors.teal,
                      progressIndicatorColor: Colors.teal,
                      backspaceColor: Colors.teal,
                      showRecentsTab: true,
                      recentsLimit: 28,
                      noRecentsText: 'No Recents',
                      noRecentsStyle:
                          TextStyle(fontSize: 20, color: Colors.black26),
                      categoryIcons: CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL)),
            ),
          ),
        ],
      ),
    );
  }
}

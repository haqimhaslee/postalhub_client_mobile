import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
//import 'package:url_launcher/link.dart';

class AskOurAi extends StatefulWidget {
  const AskOurAi({super.key});
  @override
  State<AskOurAi> createState() => _AskOurAiState();
}

class _AskOurAiState extends State<AskOurAi> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode(debugLabel: 'TextField');
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: 'AIzaSyAWoWzJ-Qh-Gfos2r3cP3_QgzCcf2ewyNs',
    );
    _chat = _model.startChat(history: [
      Content.text(
          'You are my assistant, custom chatbot for answering any queries about UTP Postal Hub powered by Gemini AI'),
      Content.model([
        TextPart(
            "Sure, I am your assistant a custom chatbot for UTP Postal Hub powered by Gemini AI, I'm here to enhance the customers experience in term of answering queries, FAQs and many more")
      ]),
    ]);
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  // PRESET VALUE OF MODEL DATA
  final int preSetChatHistory = 2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _chat.history.length <= preSetChatHistory
              ? const Expanded(
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 30, left: 30, right: 30, bottom: 30),
                          child: SizedBox(
                            height: 100,
                            width: 200,
                            child: Card(
                                elevation: 0,
                                child: Center(
                                  child: Text(
                                    'No conversation yet',
                                    style: TextStyle(
                                      fontSize: 16,
                                      //color: Colors.black,
                                    ),
                                  ),
                                )),
                          ))))
              : Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (context, idx) {
                      var content = _chat.history.toList()[
                          idx + preSetChatHistory]; // Start from index 1
                      var text = content.parts
                          .whereType<TextPart>()
                          .map<String>((e) => e.text)
                          .join('');
                      return MessageWidget(
                        text: text,
                        isFromUser: content.role == 'user',
                      );
                    },
                    itemCount: _chat.history.length -
                        preSetChatHistory, // Adjust itemCount accordingly
                  ),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        focusNode: _textFieldFocus,
                        decoration: textFieldDecoration(
                            context, 'Ask anything regarding Postal Hub...'),
                        controller: _textController,
                        onSubmitted: (String value) {
                          _sendChatMessage(value);
                        },
                      ),
                    ),
                    const SizedBox.square(
                      dimension: 8,
                    ),
                    if (!_loading)
                      ElevatedButton(
                        onPressed: () async {
                          _sendChatMessage(_textController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary, // <-- Button color
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .onPrimary, // <-- Splash color
                        ),
                        child: Icon(
                          Icons.send,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      )
                    else
                      LoadingAnimationWidget.flickr(
                        leftDotColor: Theme.of(context).colorScheme.primary,
                        rightDotColor: Theme.of(context).colorScheme.error,
                        size: 30,
                      ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    "*[AI] may display inaccurate info, including about people, so double-check its responses",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      var response = await _chat.sendMessage(
        Content.text(message),
      );
      var text = response.text;

      if (text == null) {
        _showError('Empty response.');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isFromUser;

  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: BoxDecoration(
              color: isFromUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: MarkdownBody(
              data: text,
            ),
          ),
        ),
      ],
    );
  }
}

InputDecoration textFieldDecoration(BuildContext context, String hintText) =>
    InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );

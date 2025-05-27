// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';

class ParcelMate extends StatefulWidget {
  const ParcelMate({super.key});
  @override
  State<ParcelMate> createState() => _ParcelMateState();
}

class _ParcelMateState extends State<ParcelMate> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode(debugLabel: 'TextField');
  final bool _loading = false;
  final List<Message> _messages = [];

  late final GenerativeModel _model;
  bool _modelInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVertexAI();
  }

  void _initializeVertexAI() {
    try {
      final systemInstruction = Content.system(''' ''');

      final generationConfig = GenerationConfig(
        maxOutputTokens: 8192,
        temperature: 1,
        topP: 1,
      );

      final safetySettings = [
        SafetySetting(
          HarmCategory.hateSpeech,
          HarmBlockThreshold.high,
          HarmBlockMethod.unspecified,
        ),
        SafetySetting(
          HarmCategory.dangerousContent,
          HarmBlockThreshold.high,
          HarmBlockMethod.unspecified,
        ),
        SafetySetting(
          HarmCategory.sexuallyExplicit,
          HarmBlockThreshold.high,
          HarmBlockMethod.unspecified,
        ),
        SafetySetting(
          HarmCategory.harassment,
          HarmBlockThreshold.high,
          HarmBlockMethod.unspecified,
        ),
      ];

      _model = FirebaseVertexAI.instanceFor(
        location: 'global',
      ).generativeModel(
        model: 'gemini-2.0-flash-lite-001',
        generationConfig: generationConfig,
        safetySettings: safetySettings,
        systemInstruction: systemInstruction,
      );
      _modelInitialized = true;
    } catch (e) {
      if (kDebugMode) {
        print("Error initializing Vertex AI model: $e");
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _showError(
            "Failed to initialize AI model. Chat functionality may be limited. Error: ${e.toString()}",
          );
        }
      });
    }
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Test Kitchen'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: _textFieldFocus,
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Ask anything...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  suffixIcon: _loading
                      ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(5),
                          child: IconButton(
                            icon: const Icon(Icons.send),
                            onPressed:
                                !_modelInitialized // Disable if model not ready
                                    ? null
                                    : () => _sendChatMessage(
                                          _textController.text,
                                        ),
                          ),
                        ),
                ),
                onSubmitted: !_modelInitialized // Disable if model not ready
                    ? null
                    : _sendChatMessage,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 750),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _messages.length,
                    itemBuilder: (context, idx) {
                      return MessageWidget(
                        text: _messages[idx].text,
                        isFromUser: _messages[idx].isFromUser,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendChatMessage(String text) async {
    if (text.trim().isEmpty || !_modelInitialized) return;

    final userMessage = Message(text: text, isFromUser: true);

    setState(() {
      _messages.add(userMessage);
    });
    _textController.clear();
    _scrollDown();

    final int aiMessageIndex = _messages.length;
    setState(() {
      _messages.add(Message(text: '', isFromUser: false));
    });

    await _streamVertexAIResponse(
      _messages.sublist(0, aiMessageIndex),
      aiMessageIndex,
    );

    _textFieldFocus.requestFocus();
  }

  Future<void> _streamVertexAIResponse(
    List<Message> chatHistory,
    int aiMessageIndex,
  ) async {
    if (!_modelInitialized) return;

    List<Content> conversationContents = chatHistory.map((msg) {
      return Content(msg.isFromUser ? 'user' : 'model', [
        TextPart(msg.text),
      ]);
    }).toList();

    try {
      final stream = _model.generateContentStream(conversationContents);
      StringBuffer buffer = StringBuffer();

      await for (final chunk in stream) {
        final text = chunk.text ?? '';
        buffer.write(text);

        setState(() {
          _messages[aiMessageIndex] = Message(
            text: buffer.toString(),
            isFromUser: false,
          );
        });

        _scrollDown();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Streaming error: $e");
      }
      setState(() {
        _messages[aiMessageIndex] = Message(
          text: "An error occurred while generating the response.",
          isFromUser: false,
        );
      });
    }
  }

  void _showError(String message) {
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
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
        if (!isFromUser)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/postalhub_logo.jpg'),
              radius: 13,
            ),
          ),
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            decoration: BoxDecoration(
              color: isFromUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(18),
            ),
            child: MarkdownBody(
              selectable: true,
              data: text.isEmpty && !isFromUser ? "..." : text,
              styleSheet: MarkdownStyleSheet(
                p: TextStyle(
                  color: isFromUser
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              onTapLink: (text, href, title) {
                if (href != null) {
                  try {
                    launchUrl(
                      Uri.parse(href),
                      mode: LaunchMode.externalApplication,
                    );
                  } catch (e) {
                    if (kDebugMode) {
                      print('Could not launch $href: $e');
                    }
                  }
                }
              },
            ),
          ),
        ),
        if (isFromUser) const SizedBox(width: 8),
      ],
    );
  }
}

class Message {
  final String text;
  final bool isFromUser;

  Message({required this.text, required this.isFromUser});
}

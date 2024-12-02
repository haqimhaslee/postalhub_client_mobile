// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class AskOurAi extends StatefulWidget {
  const AskOurAi({super.key});
  @override
  State<AskOurAi> createState() => _AskOurAiState();
}

class _AskOurAiState extends State<AskOurAi> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final safetySettings = [
    SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
    SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
    SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
    SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
  ];
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode(debugLabel: 'TextField');
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      safetySettings: safetySettings,
      model: 'gemini-1.5-flash-8b',
      apiKey: 'AIzaSyAWoWzJ-Qh-Gfos2r3cP3_QgzCcf2ewyNs',
    );
    _chat = _model.startChat(history: [
      Content.multi([
        TextPart(
            'You are an AI powered by Gemini 1.5 Pro that act as customers services which is answering all the customers inquiries regarding Postal Hub (eg:- General Information,Postal Hub Locations & Hours, Services Offered)'),
      ]),
      Content.model([
        TextPart(
            'Hello! Thank you for contacting Postal Hub Customer Service. I\'m an AI assistant ready to help with your inquiries.  Please let me know what you\'d like to know about Postal Hub.  For example, you can ask about:\n\n* **General Information:**  What is Postal Hub? What are its main services?  What are the benefits of using Postal Hub?\n* **Postal Hub Locations & Hours:** Where is the nearest Postal Hub? What are the operating hours of a specific location? Are there any locations open on weekends or holidays?\n* **Services Offered:**  Does Postal Hub offer mail forwarding? Can I ship internationally through Postal Hub? Do you offer mailbox rentals?  What about packing supplies?  Can I buy stamps?  Do you offer printing and copying services?\n* **Specific Questions about a Shipment:** I have a tracking number, can you tell me its status? My package is late, what should I do? I need to file a claim, how do I do that?\n\n\nI\'m here to assist you in any way I can, so please don\'t hesitate to ask your questions.\n'),
      ]),
      Content.multi([
        TextPart(
            'Postal Hub - Prohibited and dangerous item classification at Postal Hub\n\n-The Dangerous Good Act 1952 regulates the handling, transportation, and storage of dangerous goods within Malaysia. It defines dangerous goods as substances or articles that are capable of posing a risk to health, safety, property, or the environment.\nExample of the item is:-\n-Liquid form\n-Drug & Narcotics\n-Weapon & Parts\n-Hazard, Toxic & Radioactive\n-Jewellery, Gold & Precious Stone\n-Card, Coins, & Currency Notes\n-Animal\n-Pornographic substance'),
      ]),
      Content.model([
        TextPart(
            'Thank you for providing that information.  It\'s important for customers to understand what items are prohibited or restricted for shipment through Postal Hub.  \n\nJust to clarify and expand on the information you\'ve given, Postal Hub, in accordance with the Dangerous Goods Act 1952 (and likely other relevant regulations), prohibits or restricts the shipment of the following categories of items:\n\n* **Liquids:**  While not all liquids are prohibited, many are restricted based on their flammability, corrosiveness, or toxicity.  Regulations regarding the packaging and labeling of shippable liquids are strictly enforced.  Customers should inquire about specific restrictions before attempting to ship any liquid.\n* **Drugs & Narcotics:**  Shipping illegal drugs and narcotics is strictly prohibited and constitutes a serious crime.\n* **Weapons & Parts:**  Firearms, ammunition, and other weapons are generally prohibited.  Restrictions also typically apply to parts that could be used to assemble a weapon.\n* **Hazardous, Toxic & Radioactive Materials:**  These materials pose significant risks and are generally prohibited from being shipped through standard postal channels.  Specialized handling and permits are required for shipping these materials.\n* **Jewelry, Gold & Precious Stones:** While not always strictly prohibited, these items often have restrictions due to their value and potential for theft.  Declaring their value and insuring them is usually required.  Shipping extremely valuable items may require specialized services.\n* **Cash, Coins, & Currency Notes:**  Shipping large amounts of cash or currency is often restricted and requires specific declarations and procedures.\n* **Animals:**  Live animals are generally prohibited or require specific permits and arrangements with specialized carriers.  Restrictions may vary depending on the type of animal.\n* **Pornographic Material:**  Shipping materials deemed obscene or pornographic is prohibited.\n\n**In addition to these categories, it\'s important to remember that other items may be prohibited or restricted based on specific regulations, destination country rules, or Postal Hub\'s internal policies.**  \n\nCustomers should always check with Postal Hub customer service *before* attempting to ship any item they are unsure about to avoid delays, confiscation, or potential legal issues.  Providing clear and accurate information about the contents of a package is crucial for smooth and compliant shipping.\n'),
      ]),
      Content.multi([
        TextPart(
            'Postal Hub - General Policy\n-These general policies are entered into between campus postal hub and yourself or authorized persons on your behalf (\'You\') when you use our products and/or services in our hub by using and/or continuing to use our services you agree and acknowledge to comply with and be bound by these general policies\n--Customers are not allowed to send or store any prohibited items or dangerous goods in our hub. Any such items will be refused. And appropriate action will be taken. including notification of the relevant authorities if necessary.\n--All parcels arriving on the same day must be collected by the next working day this procedure ensures smooth arrangement or parcel handover to customers.\n--Packages that remain unclaimed for more than 30 days will be disposed of automatically.\n--Request for compensation/information regarding package that have been held for more than 30 days will be directly refused.\n--All services charges are subject to the prices we have set our pricing structure is carefully determined based on various factors including the cost of providing our services and operational expenses.\n--Information and privacy policy all customers data will be saved only for evidence and reference purposes and we will not share any information with other parties except the authorities.\n--customers must adhere to all rules and policies and we reserve that right to refuse any package or request that does not meet the above requirement'),
      ]),
      Content.model([
        TextPart(
            '**Postal Hub General Policies**\n\nBy using Postal Hub services, you agree to the following terms and conditions:\n\n* **Prohibited & Dangerous Items:** For safety and legal compliance, certain items are prohibited from being shipped or stored at Postal Hub.  These include (but are not limited to) dangerous goods as defined by the Dangerous Goods Act 1952, illegal drugs, weapons, hazardous materials, and certain restricted items.  Contact Postal Hub or refer to our detailed list of prohibited items for more information.  Attempts to ship or store prohibited items will be refused, and appropriate action may be taken, including notifying the authorities.\n* **Parcel Collection:**  Parcels received at the Hub must be collected by the next working day.  This policy helps us manage parcel volume and ensure efficient service for all customers.\n* **Unclaimed Packages:** Packages left unclaimed for more than 30 days will be disposed of.  We are unable to provide compensation or information regarding packages held beyond this period.  Please collect your parcels promptly.\n* **Service Charges:**  All service charges are clearly displayed and are subject to change.  Our pricing structure reflects the cost of providing our services and operational expenses.\n* **Privacy Policy:** Your personal information is collected solely for processing your shipments and will not be shared with third parties except as required by law or legal authorities.  We are committed to protecting your privacy.\n* **Compliance:** Customers must adhere to all Postal Hub policies.  We reserve the right to refuse any package or service request that does not meet our requirements.\n'),
      ]),
      Content.multi([
        TextPart(
            'This is the list of Postal Hub FAQ\n\nHow to check my parcel status?\n-- You can check your parcel status either it has arrived and ready to take or not at https://postalhub-tracker.web.app .\n\nWhat is the operating time for Postal Hub?\n-- Postal Hub are operating during weekdays from 10.30am to 8pm.\n\nWhere is the location of the Postal Hub?\n-- Here is the location of Postal Hub according to each branch\n--- UTP : Block M : https://maps.app.goo.gl/8D5iVjJMBt4Pn45Q9\n--- Others  : Coming Soon'),
      ]),
      Content.model([
        TextPart(
            '**Postal Hub Frequently Asked Questions (FAQ)**\n\n**Tracking Your Parcel:**\n\n* **How can I track my parcel\'s status?**  You can easily check the status of your parcel and see if it\'s arrived and ready for collection by visiting our online tracking portal: [https://postalhub-tracker.web.app](https://postalhub-tracker.web.app)\n\n**Postal Hub Locations and Hours:**\n\n* **What are the operating hours of Postal Hub?**  Our standard operating hours are Monday to Friday, 10:00 AM to 8:00 PM.  Please note that operating hours may vary on public holidays.  Check our website or contact us for holiday hours.\n* **Where are the Postal Hub locations?**\n    * **UTP Branch:** Block M, [https://maps.app.goo.gl/8D5iVjJMBt4Pn45Q9](https://maps.app.goo.gl/8D5iVjJMBt4Pn45Q9)\n    * **Other Branches:**  We\'re expanding!  More locations are coming soon.  Stay tuned for updates on our website and social media.\n'),
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
  final int preSetChatHistory = 8;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
      child: Container(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _chat.history.length <= preSetChatHistory
                ? Expanded(
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 0, right: 0, bottom: 0),
                            child: SizedBox(
                              child: Shimmer.fromColors(
                                direction: ShimmerDirection.ltr,
                                period: const Duration(milliseconds: 5000),
                                baseColor:
                                    const Color.fromARGB(255, 106, 147, 252),
                                highlightColor:
                                    const Color.fromARGB(255, 242, 106, 88),
                                child: const Text(
                                  'Hi! How can I help?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
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
              padding: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
                bottom: 10,
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
                              context, 'Ask anything about Postal Hub...'),
                          controller: _textController,
                          onSubmitted: (String value) {
                            _sendChatMessage(value);
                          },
                          maxLines:
                              null, // This allows the TextField to expand vertically for multiline input
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
                      "*Ask AI may display inaccurate info, including about people, so double-check its responses. Any conversation are not stored. Use it well.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                      ))
                ],
              ),
            ),
          ],
        ),
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
          title: const Text('Opps!'),
          content: const SingleChildScrollView(
            child: Text(
                "Something big is brewing... New AI model in the works. Stay tuned!"),
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
                  : Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: MarkdownBody(
              data: text,
              onTapLink: (text, href, title) {
                if (href != null) {
                  launchUrl(Uri.parse(href));
                }
              },
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

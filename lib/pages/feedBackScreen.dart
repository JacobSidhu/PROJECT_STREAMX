import 'package:flutter/material.dart';
import 'package:streamx/utils/api/api_service.dart';
import 'package:streamx/utils/theme.dart';

class FeedBackForm extends StatefulWidget {
  final kGreetingText =
      " Welcome to our feedback form! 🌟 Thank you for choosing to share your thoughts with us. Your feedback is incredibly valuable, and we're excited to hear from you. Let's make magic happen together!";
  final kPageTitle = "FeedBack Form";
  const FeedBackForm({super.key});
  @override
  State<FeedBackForm> createState() => _FeedBackFormState();
}

class _FeedBackFormState extends State<FeedBackForm> {
  bool isTextFieldFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onSurface)),
          centerTitle: true,
          title: Text(widget.kPageTitle, style: AppTheme.textTheme.titleLarge)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AnimatedContainer(
              margin: EdgeInsets.all(20),
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      width: 1,
                      color: isTextFieldFocused
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurfaceVariant)),
              height: 200,
              width: double.infinity,
              child: TextField(
                autofocus: true,
                onTap: () {
                  setState(() {
                    isTextFieldFocused = true;
                  });
                },
                onTapOutside: (event) {
                  setState(() {
                    isTextFieldFocused = false;
                  });
                },
                maxLines: null,
                keyboardType: TextInputType.multiline,
                focusNode: FocusNode(),
                cursorColor: Theme.of(context).colorScheme.primary,
                decoration: InputDecoration(
                    hintText: 'Type your message here....',
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: InputBorder.none),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Text(widget.kGreetingText,
                    textAlign: TextAlign.center,
                    style: AppTheme.textTheme.bodySmall)),
            FilledButton(
                onPressed: () {
                  // FireBase.uploadFeedback(
                  //     message: 'hello my name is joga msih');
                },
                child: Text('SUBMIT'))
          ]),
        ),
      ),
    );
  }
}

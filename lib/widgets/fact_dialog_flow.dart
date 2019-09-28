import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

import 'fact_messages.dart';

class FlutterFactsDialogFlow extends StatefulWidget {
  final String title;

  const FlutterFactsDialogFlow({Key key, this.title}) : super(key: key);

  @override
  _FlutterFactsDialogFlowState createState() => _FlutterFactsDialogFlowState();
}

class _FlutterFactsDialogFlowState extends State<FlutterFactsDialogFlow> {
  final List<FactsMessage> _fact_messages = [];
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Find it Facts'),
      ),
      body: Column(children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true, //To keep the latest messages at the bottom
            itemBuilder: (_, int index) => _fact_messages[index],
            itemCount: _fact_messages.length,
          ),
        ),
        Divider(height: 1.0),
        Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _queryInputWidget(context),
        ),
      ]),
    );
  }

  Widget _queryInputWidget(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _submitQuery,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _submitQuery(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void _submitQuery(String text) {
    _textController.clear();
    FactsMessage message = new FactsMessage(
      text: text,
      name: "mosh",
      type: true,
    );
    setState(() {
      _fact_messages.insert(0, message);
    });
    _dialogFlowResponse(text);
  }

  void _dialogFlowResponse(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/find_it.json").build();
    Dialogflow dialogFlow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogFlow.detectIntent(query);
    FactsMessage message = FactsMessage(
      text: response.getMessage() ??
          CardDialogflow(response.getListMessage()[0]).title,
      name: "Find it Bot",
      type: false,
    );
    setState(() {
      _fact_messages.insert(0, message);
    });
  }
}

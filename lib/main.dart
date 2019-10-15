import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(App());

class HomeModel extends Model {
  final String name = 'Budi';
  final int age = 32;
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Home(title: 'Halo'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _editingController = TextEditingController();
  TextEditingController _anotherEditingController = TextEditingController();
  TextEditingController _otherEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _items = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten'
  ];

  String dropOne;
  String dropTwo;
  String dropThree;
  String dropFour;

  @override
  Widget build(BuildContext context) {
    return new ScopedModel<HomeModel>(
        model: HomeModel(),
        child: Scaffold(
            appBar: AppBar(title: Text(widget.title)),
            body: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: SafeArea(
                top: false,
                bottom: false,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(),
                    child: Form(
                      key: _formKey,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                                controller: _editingController,
                                decoration: InputDecoration(
                                    labelText: 'Input your name'),
                                onEditingComplete:
                                    FocusScope.of(context).unfocus),
                            ScopedModelDescendant(
                              builder: (BuildContext context, Widget child,
                                  HomeModel model) {
                                return Column(
                                  children: <Widget>[
                                    DropdownButtonFormField(
                                      isExpanded: true,
                                      hint: const Text('Pilih item'),
                                      value: dropOne,
                                      items: _items
                                          .map((item) => DropdownMenuItem(
                                              value: item, child: Text(item)))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          dropOne = value;
                                        });
                                      },
                                    ),
                                    DropdownButtonFormField(
                                      isExpanded: true,
                                      hint: const Text('Pilih item'),
                                      value: dropTwo,
                                      items: _items
                                          .map((item) => DropdownMenuItem(
                                              value: item, child: Text(item)))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          dropTwo = value;
                                        });
                                      },
                                    ),
                                    DropdownButtonFormField(
                                      isExpanded: true,
                                      hint: const Text('Pilih item'),
                                      value: dropThree,
                                      items: _items
                                          .map((item) => DropdownMenuItem(
                                              value: item, child: Text(item)))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          dropThree = value;
                                        });
                                      },
                                    ),
                                    DropdownButtonFormField(
                                      isExpanded: true,
                                      hint: const Text('Pilih item'),
                                      value: dropFour,
                                      items: _items
                                          .map((item) => DropdownMenuItem(
                                              value: item, child: Text(item)))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          dropFour = value;
                                        });
                                      },
                                    )
                                  ],
                                );
                              },
                            ),
                            TextFormField(
                                controller: _anotherEditingController,
                                decoration: InputDecoration(
                                    labelText: 'Input your other name'),
                                onEditingComplete:
                                    FocusScope.of(context).unfocus),
                            TextFormField(
                                controller: _otherEditingController,
                                decoration: InputDecoration(
                                    labelText: 'Input your company name'),
                                onEditingComplete:
                                    FocusScope.of(context).unfocus,
                                maxLines: 3,
                                keyboardType: TextInputType.multiline),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: new InkWell(
                                  onTap: () => {}, child: Container()),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}

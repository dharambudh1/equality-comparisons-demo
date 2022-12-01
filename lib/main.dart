import 'package:equatable_demo/model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerID1 = TextEditingController();
  final TextEditingController _controllerName1 = TextEditingController();

  final TextEditingController _controllerID2 = TextEditingController();
  final TextEditingController _controllerName2 = TextEditingController();

  bool? objectForPersonResult;
  bool? objectForPersonModelWithOverrideOperatorAndHashCodeResult;
  bool? objectForPersonModelWithEquatableResult;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controllerID1.dispose();
    _controllerName1.dispose();
    _controllerID2.dispose();
    _controllerName2.dispose();
    _formKey.currentState?.dispose();
    objectForPersonResult = null;
    objectForPersonModelWithOverrideOperatorAndHashCodeResult = null;
    objectForPersonModelWithEquatableResult = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Object comparison'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  _controllerID1.text = '';
                  _controllerName1.text = '';

                  _controllerID2.text = '';
                  _controllerName2.text = '';

                  objectForPersonResult = null;
                  objectForPersonModelWithOverrideOperatorAndHashCodeResult = null;
                  objectForPersonModelWithEquatableResult = null;

                  setState(() {});
                },
                child: const Icon(Icons.clear_all)),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text('Object 1 properties'),
                    TextFormField(
                      controller: _controllerID1,
                      decoration: const InputDecoration(label: Text('ID')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter first object ID';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _controllerName1,
                      decoration: const InputDecoration(label: Text('Name')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter first object Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 52,
                    ),
                    const Text('Object 2 properties'),
                    TextFormField(
                      controller: _controllerID2,
                      decoration: const InputDecoration(label: Text('ID')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter second object ID';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _controllerName2,
                      decoration: const InputDecoration(label: Text('Name')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter second object Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 52,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final objectForPersonModel1 = PersonModel(
                            id: _controllerID1.value.text,
                            name: _controllerName1.value.text,
                          );
                          final objectForPersonModel2 = PersonModel(
                            id: _controllerID2.value.text,
                            name: _controllerName2.value.text,
                          );

                          final objectForPersonModelWithOverrideOperatorAndHashCode1 =
                              PersonModelWithOverrideOperatorAndHashCode(
                            id: _controllerID1.value.text,
                            name: _controllerName1.value.text,
                          );
                          final objectForPersonModelWithOverrideOperatorAndHashCode2 =
                              PersonModelWithOverrideOperatorAndHashCode(
                            id: _controllerID2.value.text,
                            name: _controllerName2.value.text,
                          );

                          final objectForPersonModelWithEquatable1 =
                              PersonModelWithEquatable(
                            id: _controllerID1.value.text,
                            name: _controllerName1.value.text,
                          );
                          final objectForPersonModelWithEquatable2 =
                              PersonModelWithEquatable(
                            id: _controllerID2.value.text,
                            name: _controllerName2.value.text,
                          );

                          objectForPersonResult =
                              objectForPersonModel1 == objectForPersonModel2;

                          objectForPersonModelWithOverrideOperatorAndHashCodeResult =
                              objectForPersonModelWithOverrideOperatorAndHashCode1 ==
                                  objectForPersonModelWithOverrideOperatorAndHashCode2;

                          objectForPersonModelWithEquatableResult =
                              objectForPersonModelWithEquatable1 ==
                                  objectForPersonModelWithEquatable2;

                          setState(() {});
                        }
                      },
                      child: const Text("Compare both object's properties"),
                    ),
                    const SizedBox(
                      height: 52,
                    ),
                    Visibility(
                      visible: objectForPersonResult != null &&
                          objectForPersonModelWithOverrideOperatorAndHashCodeResult !=
                              null &&
                          objectForPersonModelWithEquatableResult != null,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Result:',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: objectForPersonResult != null &&
                              objectForPersonModelWithOverrideOperatorAndHashCodeResult !=
                                  null &&
                              objectForPersonModelWithEquatableResult != null
                          ? 12
                          : 0,
                    ),
                    Visibility(
                      visible: objectForPersonResult != null,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Comparing normal objects: $objectForPersonResult',
                        ),
                      ),
                    ),
                    Visibility(
                      visible:
                          objectForPersonModelWithOverrideOperatorAndHashCodeResult !=
                              null,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Comparing objects with overridden operator & hashCode: $objectForPersonModelWithOverrideOperatorAndHashCodeResult'),
                      ),
                    ),
                    Visibility(
                      visible: objectForPersonModelWithEquatableResult != null,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Comparing objects with equatable: $objectForPersonModelWithEquatableResult'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

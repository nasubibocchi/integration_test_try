import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integration_test_try/sample_page/sample_page_view_model.dart';
import 'package:integration_test_try/second_page/second_page.dart';

class SamplePage extends HookConsumerWidget {
  const SamplePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _counter =
        ref.watch(samplePageViewModelProvider.select((s) => s.counter));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(samplePageViewModelProvider.notifier).incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              key: const Key('page route button to 2nd'),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondPage())),
                child: const Text('to 2nd page')),
          ],
        ),
      ),
    );
  }
}

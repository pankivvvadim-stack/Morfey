import 'package:flutter/material.dart';

void main() {
  runApp(const DreamApp());
}

class DreamApp extends StatelessWidget {
  const DreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Сонник Морфей',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050510),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB388FF),
          brightness: Brightness.dark,
        ),
      ),
      home: const DreamScreen(),
    );
  }
}

class DreamScreen extends StatefulWidget {
  const DreamScreen({super.key});

  @override
  State<DreamScreen> createState() => _DreamScreenState();
}

class _DreamScreenState extends State<DreamScreen> {
  final _controller = TextEditingController(
      text: 'Я летал над морем, а потом начал падать в воду');
  String _result = '';

  final Map<String, String> _dictionary = {
    'летать': 'К далёкой дороге и важным новостям.',
    'падать': 'Тревога, потеря контроля. Будьте осторожны.',
    'вода': 'Знак эмоциональных перемен или очищения.',
    'огонь': 'Испытание или внезапные новости.',
    'дом': 'Состояние вашего внутреннего мира.',
    'море': 'Глубина чувств, подсознательные процессы.',
  };

  void _analyzeDream() {
    final textLower = _controller.text.toLowerCase();
    final matches = <String>;

    _dictionary.forEach((key, value) {
      if (textLower.contains(key)) {
        matches.add('• $key — $value');
      }
    });

    setState(() {
      _result = matches.isNotEmpty
          ? matches.join('\n')
          : 'Слов из словаря не найдено. Попробуйте слова: летать, падать, вода...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Сонник',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB388FF),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF12122A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _controller,
                maxLines: 4,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Например: я летел над лесом...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _analyzeDream,
                icon: const Icon(Icons.search),
                label: const Text(
                  'Расшифровать сон',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (_result.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF12122A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _result,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const OnlineLudoApp());
}

class OnlineLudoApp extends StatelessWidget {
  const OnlineLudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Ludo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Online Ludo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      child: Icon(Icons.person, size: 32),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Player',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('Virtual Coins: 1000'),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Ludo Board',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 2,
                    color: Colors.indigo,
                  ),
                ),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 15,
                  ),
                  itemCount: 225,
                  itemBuilder: (context, index) {
                    final row = index ~/ 15;
                    final col = index % 15;

                    Color cellColor = Colors.white;

                    if (row < 6 && col < 6) {
                      cellColor = Colors.red.shade300;
                    } else if (row < 6 && col > 8) {
                      cellColor = Colors.green.shade300;
                    } else if (row > 8 && col < 6) {
                      cellColor = Colors.yellow.shade300;
                    } else if (row > 8 && col > 8) {
                      cellColor = Colors.blue.shade300;
                    }

                    return Container(
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: cellColor,
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 0.5,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Dice feature coming soon!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.casino),
                    label: const Text('Roll Dice'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Online room feature coming soon!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.public),
                    label: const Text('Online Room'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.emoji_events),
              label: const Text('Leaderboard'),
            ),
          ],
        ),
      ),
    );
  }
}

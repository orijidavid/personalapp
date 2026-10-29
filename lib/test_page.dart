import 'package:flutter/material.dart';
import 'package:personalapp/settings_page.dart';
import 'custom_widgets/item_widget.dart';
import 'model/items.dart';
import 'package:personalapp/profile/profile_screen.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

const List<MenuItem> _items = [
  MenuItem(
    'Orders History',
    Icons.fact_check_rounded,
    Color(0xFF3B9EF5),
  ),
  MenuItem(
    'Payment Method',
    Icons.credit_card_rounded,
    Color(0xFF3F6FD8),
  ),
  MenuItem(
    'Tracking',
    Icons.screen_search_desktop_rounded,
    Color(0xFFE5484D),
  ),
  MenuItem(
    'Analytics',
    Icons.pie_chart_rounded,
    Color(0xFFF2842C),
  ),
  MenuItem(
    'Settings',
    Icons.build_circle_rounded,
    Color(0xFFF5A623),
  ),
  MenuItem(
    'Profile',
    Icons.account_box_rounded,
    Color(0xFF2FB5A8),
  ),
];

class _TestPageState extends State<TestPage> {
  void _openMenuScreen(String label) {
    if (label == 'Profile') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ),
      );

      return;
    }

    if (label == 'Settings') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SettingsPage(),
        ),
      );

      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuDestinationScreen(
          title: label,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Blue balance section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 80),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      // Header
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          8,
                          20,
                          8,
                          20,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 50,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Hello You',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                showSearch(
                                  context: context,
                                  delegate: MenuSearchDelegate(
                                    items: _items,
                                    onSelected: _openMenuScreen,
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.search,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Balance
                      const Text(
                        'Naira: 200000',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_circle_down,
                              size: 30,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Naira: 20000',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Today',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Deposit and Withdraw
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const MenuDestinationScreen(
                                      title: 'Deposit',
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.arrow_circle_down,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Deposit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const MenuDestinationScreen(
                                      title: 'Withdraw',
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.arrow_circle_up,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Withdraw',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // White menu section
          Positioned(
            top: 260,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  24,
                  16,
                  24,
                ),
                itemCount: _items.length,
                physics: BouncingScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (context, index) {
                  final item = _items[index];

                  return MenuCard(
                    item: item,
                    onTap: () => _openMenuScreen(item.label),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder destination for screens not implemented yet.
class MenuDestinationScreen extends StatelessWidget {
  final String title;

  const MenuDestinationScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getIcon(title),
              size: 70,
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            Text(
              '$title Screen',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'You can implement this screen here.',
            ),
          ],
        ),
      ),
    );
  }


  IconData _getIcon(String title) {
    switch (title) {
      case 'Orders History':
        return Icons.fact_check_rounded;
      case 'Payment Method':
        return Icons.credit_card_rounded;
      case 'Tracking':
        return Icons.screen_search_desktop_rounded;
      case 'Analytics':
        return Icons.pie_chart_rounded;
      case 'Settings':
        return Icons.build_circle_rounded;
      case 'Deposit':
        return Icons.arrow_circle_down;
      case 'Withdraw':
        return Icons.arrow_circle_up;
      default:
        return Icons.dashboard;
    }
  }
}

// Search menu items by name.
class MenuSearchDelegate extends SearchDelegate<String> {
  final List<MenuItem> items;
  final ValueChanged<String> onSelected;

  MenuSearchDelegate({
    required this.items,
    required this.onSelected,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, ''),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResults(context);
  }

  Widget _buildResults(BuildContext context) {
    final results = items.where(
          (item) => item.label.toLowerCase().contains(
        query.toLowerCase(),
      ),
    );

    return ListView(
      children: results.map((item) {
        return ListTile(
          leading: Icon(item.icon, color: item.color),
          title: Text(item.label),
          onTap: () {
            close(context, item.label);
            onSelected(item.label);
          },
        );
      }).toList(),
    );
  }
}
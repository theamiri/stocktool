import 'package:flutter/material.dart';

class WifiNetworksPage extends StatefulWidget {
  const WifiNetworksPage({super.key});

  @override
  State<WifiNetworksPage> createState() => _WifiNetworksPageState();
}

class _WifiNetworksPageState extends State<WifiNetworksPage> {
  int _selectedNetworkIndex = 6; // 7th network (index 6) is selected

  final List<String> _networks = [
    'ABCDEFGH',
    'XXXXXXXXXX',
    'XXXXXXXXXX',
    'XXXXXXXXXX',
    'XXXXXXXXXX',
    'XXXXXXXXXX',
    'XXXXXXXXXX', // This one is selected
    'XXXXXXXXXX',
    'XXXXXXXXXX',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            color: const Color(0xFFE6A72C), // Mustard yellow
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    // Back button
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),

                    // Title
                    const Expanded(
                      child: Text(
                        'WIFI NETWORKS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Empty space for centering
                    const SizedBox(width: 48),
                  ],
                ),
              ),
            ),
          ),

          // Network list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: _networks.length,
              itemBuilder: (context, index) {
                final isSelected = index == _selectedNetworkIndex;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedNetworkIndex = index;
                      });
                      // Navigate to password screen after a short delay
                      final navigator = Navigator.of(context);
                      Future.delayed(const Duration(milliseconds: 500), () {
                        if (mounted) {
                          navigator.pushNamed('/wifi-password');
                        }
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: isSelected
                            ? Border.all(color: Colors.blue, width: 2)
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Network name
                            Text(
                              _networks[index],
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            // WiFi signal icon
                            const Icon(
                              Icons.wifi,
                              color: Colors.grey,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

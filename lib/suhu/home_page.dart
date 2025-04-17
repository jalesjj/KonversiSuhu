import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/temperature_provider.dart';

class MyKonversiSuhuHomePage extends StatelessWidget {
  const MyKonversiSuhuHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tempProvider = Provider.of<TemperatureProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Konversi Suhu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 4,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              'assets/suhu.jpg',
              height: 100,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: tempProvider.suhuController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Masukkan Suhu',
                prefixIcon: const Icon(Icons.thermostat),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: tempProvider.selectedFrom,
                  items: tempProvider.suhuMap.keys.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    tempProvider.selectedFrom = newValue!;
                    tempProvider.notifyListeners();
                  },
                ),
                const Text('ke'),
                DropdownButton<String>(
                  value: tempProvider.selectedTo,
                  items: tempProvider.suhuMap.keys.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    tempProvider.selectedTo = newValue!;
                    tempProvider.notifyListeners();
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: tempProvider.convertTemperature,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Konversi'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                'Hasil: ${tempProvider.hasil.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

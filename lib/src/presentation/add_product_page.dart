import 'package:flutter/material.dart';
import 'package:testdaten/src/data/firestore_repo.dart';
import 'package:testdaten/src/domain/product.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final _firestore = FirestoreRepo();

  Future<void> _addProduct() async {
    final name = _nameController.text;
    final description = _descController.text;
    final url = _urlController.text;
    final price = double.tryParse(_priceController.text) ?? 0.0;

    await _firestore.addProduct(Product(name, description, price, url));
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _nameController.text.isEmpty ? "Neues Produkt" : _nameController.text,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: _urlController.text.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(_urlController.text),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: Colors.grey[300],
                ),
                child: _urlController.text.isEmpty
                    ? Center(
                        child: Icon(Icons.image, size: 48, color: Colors.grey),
                      )
                    : null,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Bezeichnung"),
                onChanged: (_) => setState(() {}),
              ),
              TextField(
                controller: _descController,
                decoration: InputDecoration(labelText: "Beschreibung"),
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: "Preis"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _urlController,
                decoration: InputDecoration(labelText: "url"),
                onChanged: (_) => setState(() {}),
              ),
              FilledButton(onPressed: _addProduct, child: Text("Hinzufügen")),
            ],
          ),
        ),
      ),
    );
  }
}

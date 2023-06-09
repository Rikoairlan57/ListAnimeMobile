import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/search_provider.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  String _searchInput = '';
  bool _isFilled = false;
  final textController = TextEditingController();
  void searchSubmit() {
    if (textController.text.isNotEmpty) {
      if (textController.text !=
          Provider.of<SearchProvider>(context, listen: false).title) {
        FocusScope.of(context).requestFocus(FocusNode());
        Provider.of<SearchProvider>(context, listen: false)
            .TriggerSearch(textController.text);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please input some text.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colors.white),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Icon(
              Icons.search,
              size: 20,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 45,
              child: SingleChildScrollView(
                child: TextField(
                  onChanged: (value) {
                    if (value.isNotEmpty && _searchInput.isEmpty) {
                      setState(() {
                        _isFilled = true;
                      });
                    } else if (value.isEmpty && _searchInput.isNotEmpty) {
                      setState(() {
                        _isFilled = false;
                      });
                    }
                    _searchInput = value;
                  },
                  controller: textController,
                  maxLines: 1,
                  // minLines: 1,
                  onSubmitted: (_) => searchSubmit(),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 12),
                      hintText: 'Search something...'),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => searchSubmit(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: const Text(
                'Search',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          if (_isFilled)
            GestureDetector(
              onTap: () {
                setState(() {
                  _isFilled = false;
                });
                textController.text = '';
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Icon(
                  Icons.cancel_outlined,
                ),
              ),
            )
        ],
      ),
      // width: double.infinity,
    );
  }
}

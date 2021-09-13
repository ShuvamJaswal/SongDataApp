import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:songdataapp/providers/search_result_provider.dart';
import 'package:songdataapp/widgets/search_result_container.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Song Data',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchFieldEdit(),
            SearchResultContainer(),
          ],
        ),
      ),
    );
  }
}

class SearchFieldEdit extends StatelessWidget {
  final searchFieldInputController = TextEditingController();
  final String domainUrl = 'https://genius.com/api/';

  @override
  Widget build(BuildContext context) {
    final searchResult = Provider.of<SearchResultProvider>(context);
    return Row(
      children: [
        Expanded(
          child: TextField(
            //on 1stTap it will fetch the result
            onTap: () {
              // searchResult.fetchData('${domainUrl}search/song?q=*');
            },
            onChanged: (String fieldText) => fieldText.isEmpty
                ? searchResult.fetchData('${domainUrl}search/song/')
                : searchResult
                    .fetchData('${domainUrl}search/song?q=${fieldText.trim()}'),

            onSubmitted: (String fieldText) => searchResult.fetchData(
                'https://genius.com/api/search/song?q=${fieldText.trim()}'),
            controller: searchFieldInputController,
            autofocus: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              labelText: "Enter Term to search.",
            ),
          ),
        ),
      ],
    );
  }
}

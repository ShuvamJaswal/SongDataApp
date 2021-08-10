import 'package:flutter/material.dart';
import '../providers/search_result_provider.dart';
import 'package:provider/provider.dart';

class SearchResultContainer extends StatefulWidget {
  @override
  _SearchResultContainerState createState() => _SearchResultContainerState();
}

class _SearchResultContainerState extends State<SearchResultContainer> {
  @override
  Widget build(BuildContext context) {
    final searchResults = Provider.of<SearchResultProvider>(context);

    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(16.0),
          child: searchResults.isFetching
              ? CircularProgressIndicator()
              : searchResults.getResponseJson().length == 0
                  ? Text("Please Enter Something To Search")
                  : ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: 5, //searchResults.getResponseJson().length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(searchResults
                                      .getResponseJson()[index]['result']
                                  ['song_art_image_thumbnail_url']),
                            ),
                            title: //Text(searchResults.getResponseJson()[0]),
                                Text(
                              searchResults.getResponseJson()[index]['result']
                                  ['full_title'],
                            ));
                      },
                    )
          // : Text("Press Button above to fetch data"),
          ),
    );
  }
}

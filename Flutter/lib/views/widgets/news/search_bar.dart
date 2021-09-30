import 'package:flutter/material.dart';
import 'package:flutter_app/view_models/search/topic_search.dart';
import 'package:flutter_app/views/widgets/buttons/app_button.dart';
class NewsSearchSheet extends StatefulWidget {
  final TopicSearch search;
  const NewsSearchSheet({
    Key? key,
    required this.search,
  }) : super(key: key);

  @override
  _NewsSearchSheetState createState() => _NewsSearchSheetState();
}

class _NewsSearchSheetState extends State<NewsSearchSheet> {
  TopicSearch _topicSearch = TopicSearch();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _topicSearch.fromSearch(widget.search);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _topicSearch.id == null ? null:_topicSearch.id.toString(),
                validator: (value) => (int.tryParse(value??"")??0) > 0
                    ? null :"Invalid form id",
                keyboardType: TextInputType.number,
                onSaved: (value){
                  _topicSearch.id = int.parse(value??'');
                },
                  textInputAction: TextInputAction.search,
                onEditingComplete:(){
                  if(_formKey.currentState?.validate() == false){
                    return;
                  }
                  _formKey.currentState?.save();
                  Navigator.of(context).pop(_topicSearch);
                }
              ),
              Visibility(
                visible: _topicSearch.isSearching(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: AButton(
                      text: "Clear Search",
                      onPressed:(){
                        _topicSearch = TopicSearch();
                        Navigator.of(context).pop(_topicSearch);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32,),
            ],
          ),
        ),
      ),
    );
  }
}

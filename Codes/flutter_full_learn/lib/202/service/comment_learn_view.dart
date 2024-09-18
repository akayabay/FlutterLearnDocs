import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/comment_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class CommentLearnView extends StatefulWidget {
  const CommentLearnView({super.key, this.postId});
  //3
  final int? postId;

  @override
  State<CommentLearnView> createState() => _CommentLearnViewState();
}

class _CommentLearnViewState extends State<CommentLearnView> {
  //1
  late final IPostService _postService;
  bool _isLoading = false;
  List<CommentModel>? _commentsItem;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  //4
  Future<void> fetchItemsWithId(int postId) async {
    _changeLoading();
    _commentsItem = await _postService.fetchRelatedCommentsWithPostId(postId);
    _changeLoading();
  }

  @override
  void initState() {
    super.initState();
    //2
    _postService = PostService();
    //5
    fetchItemsWithId(widget.postId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _commentsItem?.length ?? 0,
        itemBuilder: (context, index) {
          return Text(_commentsItem?[index].email ?? '');
        },
      ),
    );
  }
}

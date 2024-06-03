import 'package:bloc_practice/utils/post_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/post/post_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post Screen"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch(state.postStatus){
            case PostStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostStatus.failed:
              return const Center(
                child: Text("Getting some error"),
              );
            case PostStatus.success:
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(

                  );
                },
                itemCount: state.postList.length,
              );
          }
        },
      ),
    );
  }
}

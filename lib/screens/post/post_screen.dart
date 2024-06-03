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
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post Screen"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
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
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green,
                    ),
                    child: ListTile(
                      title: Text(
                        state.postList[index].title!,
                        style: const TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        state.postList[index].body!,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
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

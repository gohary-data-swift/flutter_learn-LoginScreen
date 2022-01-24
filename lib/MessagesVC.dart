import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesVC extends StatelessWidget {
  const MessagesVC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/44051930?s=400&u=767052b9bc8e422317f02f0c41421111b603e57c&v=4'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Chats',
                      style: TextStyle(fontSize: 30, color: Colors.black54),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20.0,
                ),
              )),
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20.0,
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(fontSize: 20.0, color: Colors.black54),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => SizedBox(
                      width: 20
                  ),
                  itemCount: 10,
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) => SizedBox(
                    width: 20
                ),
                itemCount: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
    children: [
      Stack(
        children: [
          Container(
            width: 70,
            child: Column(
              children: [
                Stack(
                  children: const [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/44051930?s=400&u=767052b9bc8e422317f02f0c41421111b603e57c&v=4'),
                    ),
                    CircleAvatar(
                      radius: 10.0,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/44051930?s=400&u=767052b9bc8e422317f02f0c41421111b603e57c&v=4'),
                    ),
                  ],
                  alignment: AlignmentDirectional.bottomEnd,
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(
        width: 15,
      ) ,
      Column(
        children: [
          Text(
            'Ahmed Elgohary',

            style: TextStyle(
                fontSize: 15.0, color: Colors.black54),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Ahmed Elgohary',
            style: TextStyle(
                fontSize: 15.0, color: Colors.black54),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      )
    ],
  );
  Widget buildStoryItem() => Row(
    children: [
      Stack(
        children: [
          Container(
            width: 70,
            child: Column(
              children: [
                Stack(
                  children: const [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/44051930?s=400&u=767052b9bc8e422317f02f0c41421111b603e57c&v=4'),
                    ),
                    CircleAvatar(
                      radius: 10.0,
                      backgroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/44051930?s=400&u=767052b9bc8e422317f02f0c41421111b603e57c&v=4'),
                    ),
                  ],
                  alignment: AlignmentDirectional.bottomEnd,
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(
        width: 15,
      ) ,
      Column(
        children: [
          Text(
            'Ahmed Elgohary',

            style: TextStyle(
                fontSize: 15.0, color: Colors.black54),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      )
    ],
  );
}

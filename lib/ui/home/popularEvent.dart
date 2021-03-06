import 'package:eni/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:eni/components/heroPost.dart';
import 'package:flutter_redux/flutter_redux.dart';

Widget _cardEvent(context, item) {
  return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen();
          })),
      child: Hero(
          tag: item['id'],
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item['title'],
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.schedule,
                            size: 15.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(item['date'],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0)),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.place,
                                size: 15.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(item['locale'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.0))
                            ],
                          ))
                    ],
                  ),
                ),
                Image(
                  image: AssetImage('images/eletronic.jpg'),
                  width: 160.0,
                )
              ],
            ),
            color: Color.fromRGBO(46, 13, 218, .5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin:
                EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
          )));
}

Widget popularEvents() {
  return Column(children: <Widget>[
    Row(children: <Widget>[
      Text(
        'Popular events',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      )
    ]),
    Container(
        width: double.infinity,
        height: 300.0,
        child: StoreConnector<AppState, List>(
            builder: (BuildContext context, list) {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return _cardEvent(context, list[index]);
                },
              );
            },
            converter: (store) => store.state.events)),
  ]);
}

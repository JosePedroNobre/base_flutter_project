import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:movies/constants/Styles.dart';
import 'package:movies/network/api/model/Group.dart';

class TodayScreen extends StatefulWidget {
  @override
  _TodayScreenState createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        _builHeader(),
        SizedBox(height: 15),
        _builsLastMovementCard(),
        SizedBox(height: 15),
        Divider(),
        SizedBox(height: 20),
        _buildGroupsHeader(),
        SizedBox(
          height: 3,
        ),
        _buildGroupsBody()
      ],
    );
  }

  Widget _builHeader() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              "Hello, José",
              style: muliBold(24, Color(0xff0F2935)),
            ),
            SizedBox(height: 8),
            Text("Let's check your expenses of October",
                style: muliBold(14, Colors.grey)),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Text("2000 €", style: muliBold(30, Color(0xff0F2935))),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xff0F2935),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _builsLastMovementCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 85,
        child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.monetization_on,
                          size: 40,
                          color: Color(0xff0F2935),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Last movement done",
                                style: muliBold(14, Color(0xff0F2935)),
                              ),
                              Text(
                                "House(200)",
                                style: muliBold(14, Colors.grey),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff0F2935),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildGroupsHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(children: <Widget>[
        Text(
          "My Groups",
          style: muliBold(24, Color(0xff0F2935)),
        ),
        Spacer(),
        MaterialButton(
          child: Text(
            "Create group",
            style: muliBold(13, Colors.white),
          ),
          color: Color(0xff0F2935),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0)),
          onPressed: () {},
        )
      ]),
    );
  }

  Widget _buildGroupsBody() {
    List<Group> list = [
      Group(name: "House", icon: Icons.home, valueSpent: 170, totalValue: 200),
      Group(
          name: "Restaurant",
          icon: Icons.restaurant,
          valueSpent: 50,
          totalValue: 120),
      Group(
          name: "Fun",
          icon: Icons.linked_camera,
          valueSpent: 10,
          totalValue: 100)
    ];
    return Expanded(
        child: GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 30,
      childAspectRatio: (MediaQuery.of(context).size.width - 18) / 391,
      padding: EdgeInsets.all(10.0),
      children: list.map((value) {
        return GestureDetector(
          onTap: () {},
          child: Column(
            children: <Widget>[_builGroupItem(value)],
          ),
        );
      }).toList(),
    ));
  }

  Widget _builGroupItem(Group group) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 55),
              child: Container(
                height: 125,
                child: FAProgressBar(
                  progressColor: (group.valueSpent * 100) / group.totalValue <
                          51
                      ? Colors.green
                      : (group.valueSpent * 100) / group.totalValue < 80
                          ? Colors.orange
                          : Colors
                              .red, //colocar uns cards no statistics (imitrar o today screen da neobrain)
                  verticalDirection: VerticalDirection.up,
                  direction: Axis.vertical,
                  currentValue: group.valueSpent.toInt(),
                  maxValue: group.totalValue.toInt(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              children: <Widget>[
                Container(
                    height: 140,
                    width: 140,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              group.icon,
                              size: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                group.name,
                                style: muliSemiBold(15, Colors.black),
                              ),
                            ),
                          ],
                        ))),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Spent: ",
                      style: muliBold(15, Colors.grey),
                    ),
                    Text(
                      group.valueSpent.toString(),
                      style: muliBold(15, Colors.black),
                    )
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Limit: ",
                      style: muliBold(15, Colors.grey),
                    ),
                    Text(
                      group.totalValue.toString(),
                      style: muliBold(15, Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

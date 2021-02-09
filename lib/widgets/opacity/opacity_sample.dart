import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:transparent_image/transparent_image.dart';

class OpacitySample extends StatelessWidget {
  static const String _url = "https://i.pravatar.cc/150";
  static const Color _detailColor = Color.fromARGB(255, 116, 135, 243);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 241, 252),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildToolbar(context),
              _buildAvatar(),
              _buildUserInfo(),
              _buildUserActiveDate(),
              _buildPlans(),
              _buildUsageInfo(),
              _buildUsage(),
              _buildBottomNav()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToolbar(context) {
    return Padding(
      padding: const EdgeInsets.only(top : 57),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text("Account", style: _toolbarStyle()),
            ),
          ),
          Icon(Icons.more_horiz)
        ],
      ),
    );
  }

  _toolbarStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black);
  }

  _buildAvatar() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(300),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: _url,
            ),
          ),
        ),
      ),
    );
  }

  _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Text(
        "Alex Smith",
        style: _userInfoTextStyle(),
      ),
    );
  }

  _userInfoTextStyle() {
    return TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black87);
  }

  _buildUserActiveDate() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        "Active from Aug 20. 2019",
        style: _userActiveDateTextStyle(),
      ),
    );
  }

  _userActiveDateTextStyle() {
    return TextStyle(color: Colors.black45, fontSize: 18);
  }

  _buildPlans() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your plan",
              textAlign: TextAlign.start,
              style: _plansTitleTextStyle(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle),
                  child: _buildPlan(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _plansTitleTextStyle() {
    return TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
  }

  _buildPlan() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 231, 255)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.wifi,
                  color: Color.fromARGB(255, 222, 92, 255),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Basic Plan",
                  style: _planTitleTextStyle(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Opacity(
                    opacity: 0.5,
                    child: Text(
                      "50GB",
                      style: _planTitleTextStyle(),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _planTitleTextStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
  }

  _buildUsageInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Usage info",
            textAlign: TextAlign.start,
            style: _plansTitleTextStyle(),
          ),
          Text(
            "See detail",
            textAlign: TextAlign.start,
            style: _detailTextStyle(),
          ),
        ],
      ),
    );
  }

  _buildUsage() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Opacity(
        opacity: 0.6,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle),
          child: _buildUsageStatistics(),
        ),
      ),
    );
  }

  _detailTextStyle() {
    return TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: _detailColor);
  }

  _buildUsageStatistics() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 16, 0, 16),
          child: Container(
            constraints: BoxConstraints(
                maxWidth: 400, maxHeight: 400, minHeight: 100, minWidth: 100),
            child: CircularPercentIndicator(
              radius: 120.0,
              backgroundColor: Color.fromARGB(255, 239, 243, 254),
              lineWidth: 10,
              animation: false,
              percent: 0.3,
              center: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "550 MB",
                    style: _progressValueTextStyle(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "Total",
                      style: _progressTotalTextStyle(),
                    ),
                  ),
                ],
              ),
              progressColor: _detailColor,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 0, 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.cloud_upload,
                      color: Colors.grey[500],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Upload",
                        style: _usageTitleTextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 8),
                child: Text(
                  "250 MB",
                  style: _usageValueTextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 0, 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.cloud_download,
                      color: Colors.grey[500],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Download",
                        style: _usageTitleTextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 8),
                child: Text(
                  "350 MB",
                  style: _usageValueTextStyle(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _progressValueTextStyle() {
    return TextStyle(
        color: _detailColor, fontWeight: FontWeight.bold, fontSize: 15);
  }

  _progressTotalTextStyle() {
    return TextStyle(
        color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 13);
  }

  _usageTitleTextStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold, color: Colors.grey[500], fontSize: 15);
  }

  _usageValueTextStyle() {
    return TextStyle(
        fontWeight: FontWeight.w800, color: Colors.black, fontSize: 16);
  }

  _buildBottomNav() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
      child: Opacity(
          opacity: 0.6,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Row(
              children: [
                _buildBottomNavItem("Home", Icons.home_outlined),
                _buildBottomNavItem("Office", Icons.work_outline_outlined),
                _buildBottomNavItem(
                    "Notification", Icons.notifications_outlined),
                _buildBottomNavItem("Account", Icons.person_outlined,
                    selected: true)
              ],
            ),
          )),
    );
  }

  _buildBottomNavItem(String title, IconData icon, {bool selected = false}) {
    return Expanded(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon,
              color: selected
                  ? Color.fromARGB(255, 150, 178, 249)
                  : Colors.grey[500]),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: _bottomNavigationTextStyle(selected),
          ),
        ),
      ],
    ));
  }

  _bottomNavigationTextStyle(selected) {
    return TextStyle(
        fontWeight: FontWeight.w600,
        color:
            selected ? Color.fromARGB(255, 150, 178, 249) : Colors.grey[500]);
  }
}

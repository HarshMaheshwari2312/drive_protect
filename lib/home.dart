import 'dart:async';

import 'package:flutter/material.dart';
import 'package:driveprotect/NavBar.dart';
import 'package:driveprotect/contacts.dart';
import 'package:driveprotect/dashboard.dart';
import 'package:driveprotect/events.dart';
import 'package:driveprotect/notes.dart';
import 'package:driveprotect/notifications.dart';
import 'package:driveprotect/privacy_policy.dart';
import 'package:driveprotect/send_feedback.dart';
import 'package:driveprotect/settings.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.dashboard;
  GoogleMapController? mapController;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  late Marker marker;

  @override
  void initState(){
    super.initState();
    marker = Marker(
      markerId: MarkerId("marker"),
      position: LatLng(27.6, 54.3),
      infoWindow: InfoWindow(title: "Marker"),
    );
    dbRef.child('lat').onValue.listen((event) {
      if (event.snapshot.value != null) {
        // Get the latitude value from Firebase as double
        String latitudeStr = event.snapshot.value.toString();

        // Convert the latitude string to a double
        double latitude = double.tryParse(latitudeStr) ?? 0.0;
        updateMarkerPosition(latitude);
      }
    });

    dbRef.child('log').onValue.listen((event) {
      if (event.snapshot.value != null) {
        // Get the longitude value from Firebase as double
        String longitudeStr = event.snapshot.value.toString();

        // Convert the longitude string to a double
        double longitude = double.tryParse(longitudeStr) ?? 0.0;
        updateMarkerPosition(null, longitude);
      }
    });
  }
  void updateMarkerPosition([double? latitude, double? longitude]) {
    // Get the current marker position
    LatLng currentPosition = marker.position;

    // Update the marker's position with new latitude and/or longitude
    if (latitude != null) {
      currentPosition = LatLng(latitude, currentPosition.longitude);
    }
    if (longitude != null) {
      currentPosition = LatLng(currentPosition.latitude, longitude);
    }

    // Update the marker
    setState(() {
      marker = Marker(
        markerId: MarkerId("marker"),
        position: currentPosition,
        infoWindow: InfoWindow(title: "Marker"),
      );

    });
    mapController?.animateCamera(CameraUpdate.newLatLng(currentPosition));
  }

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Drive Protect"),
      ),
      body: Container(
        color: Colors.grey[200], // Set the desired background color
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items to the left
          children: <Widget>[
            Container(
              height: 500, // Set the desired height here
              child: GoogleMap(
                onMapCreated: (controller) {
                  mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(27.6, 54.3),
                  zoom: 12.0,
                ),
                markers: {marker},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.directions_car_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8), // Add some space between the icon and text
                      Text(
                        "STATUS:", // Replace with actual speed value
                        style: TextStyle(fontSize: 18), // Adjust the font size
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.speed,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 8), // Add some space between the icon and text
                      Text(
                        "Speed: 60 km/h", // Replace with actual speed value
                        style: TextStyle(fontSize: 16), // Adjust the font size
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.analytics,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8), // Add some space between the icon and text
                      Text(
                        "Acceleration: 2 m/s²", // Replace with actual acceleration value
                        style: TextStyle(fontSize: 16), // Adjust the font size
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.local_gas_station, // Icon for fuel status
                        color: Colors.orange,
                      ),
                      SizedBox(width: 8), // Add some space between the icon and text
                      Text(
                        "Fuel Status: Full", // Replace with actual fuel status value
                        style: TextStyle(fontSize: 16), // Adjust the font size
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "PDF", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
              Navigator.pushNamed(context, '/dashboard');
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
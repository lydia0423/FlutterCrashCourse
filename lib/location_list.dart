import 'package:Lesson1/location_detail.dart';
import 'package:flutter/material.dart';
import 'models/location.dart';
import 'location_detail.dart';
import 'styles.dart';

class LocationList extends StatelessWidget{
  final List<Location> locations;

  LocationList(this.locations);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Locations", style: Styles.navBarTitle)),
      body: ListView.builder(
        itemCount: this.locations.length,
        itemBuilder: _listViewItemBuilder,
      ),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index){
    var location = this.locations[index];
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      leading: _itemTumbnail(location),
      title: _itemTitle(location),
      //pass a call back-- a function to pass the value
      onTap: () => _navigateToLocationDetail(context, location),
    );
  }

  void _navigateToLocationDetail(BuildContext context, Location location){
    Navigator.push(context, MaterialPageRoute(
      // => same function with {}, but it is useful when only want to execute one statement
      builder: (context) =>LocationDetail(location),
    ));
  }

  Widget _itemTumbnail(Location location){
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: Image.network(location.url, fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTitle(Location location){
    return Text('${location.name}', style: Styles.textDefault); //string interpolation
    
  }
}
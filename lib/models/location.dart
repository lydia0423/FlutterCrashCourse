import './location_fact.dart';

class Location{
  //attributes
  final String name;
  final String url;
  final List<LocationFact> facts;
  //constructor
  Location({this.name, this.url, this.facts});
}
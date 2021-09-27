# flutter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---------------------


## IMPORTANT RULES
## IMPORTANT RULES

[APP-Structure]
=> APIS  - Handle Http Requests
=> Controllers  - Handle All Logic ( calling Api or Mapping Data, ... )
=> Providers  - Handle View And NotifyListeners 
=> ViewModels - Contain All view models "entities" which used in data mapping (fromJson,..)
=> Views  - Contains all folders and files dealing with UI (screens, widgets, style, ...)

# [Note]
The Flow of data will be as follow:
- (Views) Call only Providers to listen to the data changes, NOT Apis OR Controllers
- All UI Logic should be handled in Providers
- (Providers) Call only Controllers to get data, Not APis
- (Controllers) call Apis, and implement all logic and return the value to providers



[Widget-Structure]
1 => Class variables (if exist)
2 => Ui Actions & User Actions (if exist)
3 => @override methods (if exist)
4 => build Method 
5 => Widget ui Varaibles [inside build method] (if exist)
6 => return for build Widget
7 => Widget ui functions (if exist)


# [Note]
- Example for this structure [WidgetStructure] in rules\widget_structure.md
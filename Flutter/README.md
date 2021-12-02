# flutter FE Library

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
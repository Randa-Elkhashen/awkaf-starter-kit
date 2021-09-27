## IMPORTANT RULES

[Structure]
=> APIS  - Handle Http Requests
=> Controllers  - Handle All Logic ( calling Api or Mapping Data, ... )
=> Providers  - Handle View And NotifyListeners 
=> ViewModels - Contain All view models "entities" which used in data mapping (fromJson,..)
=> Views  - Contains all folders and files dealing with UI (screens, widgets, style, ...)

# [Note]
The Flow of data will be as follow:
(Views) Call only Providers to listen to the data changes, NOT Api OR Controller
(Providers) Call only Controllers to get data, Not APis
(Controllers) call Apis, and implement all logic and return the value to providers
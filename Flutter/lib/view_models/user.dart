class User{
  String? id;
  String? displayName;
  String? userName;
  String? password;
  String? email;
  String? phoneNumber;
  String? token;

  User({
    this.id,
    this.displayName,
    this.email,
    this.password,
    this.phoneNumber,
    this.userName,
    this.token,
  });

  Map<String,dynamic> toMap(){
    Map<String,String> map = {};
    if(id != null) map["ID"] = id!;
    if(email != null) map["email"] = email!;
    if(displayName != null) map["name"] = displayName!;
    if(userName != null) map["user_login"] = userName!;
    if(phoneNumber != null) map["phone"] = phoneNumber!;
    if(password != null) map["password"] = password!;
    if(token != null) map["token"] = token!;
    return map;
  }

  fromUser(User? newUser){
    id = newUser?.id;
    displayName = newUser?.displayName;
    email = newUser?.email;
    password = newUser?.password;
    phoneNumber = newUser?.phoneNumber;
    token = newUser?.token;
    userName = newUser?.userName;
  }

  factory User.fromJson(Map<String,dynamic> parsedJson){
    return User(
      id: parsedJson["user"]["id"].toString(),
      displayName: parsedJson["user"]["name"],
      userName: parsedJson["user"]["user_name"],
      email: parsedJson["user"]["email"],
      phoneNumber: parsedJson["user"]["phone"],
      token: parsedJson["token"],
    );
  }

  factory User.fromSettingJson(Map<String,dynamic> parsedJson){
    return User(
      id: parsedJson["id"].toString(),
      displayName: parsedJson["name"],
      userName: parsedJson["user_name"],
      email: parsedJson["email"],
      phoneNumber: parsedJson["phone"],
      token: parsedJson["token"],
    );
  }
}
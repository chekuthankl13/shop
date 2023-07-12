class AuthModel {
  final String id;
  final String userName;
  final String email;
  final String img;
  final String token;
  final String gender;

  AuthModel(
      {required this.id,
      required this.userName,
      required this.email,
      required this.img,
      required this.token,
      required this.gender});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
      id: json['id'].toString(),
      userName: json['username'],
      email: json['email'],
      img: json['image'],
      token: json['token'],
      gender: json['gender']);
}


// {
//   "id": 15,
//   "username": "kminchelle",
//   "email": "kminchelle@qq.com",
//   "firstName": "Jeanne",
//   "lastName": "Halvorson",
//   "gender": "female",
//   "image": "https://robohash.org/autquiaut.png",
//   "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvYXV0cXVpYXV0LnBuZyIsImlhdCI6MTY4ODYyMDk2OCwiZXhwIjoxNjg4NjI0NTY4fQ.Bv3gRjTQ15gWm4AbLG77y94D23hi96-Ps-fidka_ddk"
// }
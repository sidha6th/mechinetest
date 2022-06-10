class IndividualUserDataModel {
  String? id;

  String? title;

  String? firstName;

  String? lastName;

  String? picture;

  String? phone;

  String? dateOfBirth;

  String? email;

  String? gender;

  IndividualUserDataModel({
    this.dateOfBirth,
    this.email,
    this.firstName,
    this.gender,
    this.id,
    this.lastName,
    this.phone,
    this.picture,
    this.title,
  });

  IndividualUserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
    phone = json['phone'];
    gender = json['gender'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
  }
}

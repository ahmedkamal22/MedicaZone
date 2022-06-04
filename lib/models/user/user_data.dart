class UserDataModel {
  int? id;
  String? name;
  String? email;
  Null? phone;
  Null? emailVerifiedAt;
  Null? currentTeamId;
  Null? profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  Null? lastSeen;
  int? userType;
  String? profilePhotoUrl;

  UserDataModel(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.emailVerifiedAt,
        this.currentTeamId,
        this.profilePhotoPath,
        this.createdAt,
        this.updatedAt,
        this.lastSeen,
        this.userType,
        this.profilePhotoUrl});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastSeen = json['last_seen'];
    userType = json['userType'];
    profilePhotoUrl = json['profile_photo_url'];
  }

}

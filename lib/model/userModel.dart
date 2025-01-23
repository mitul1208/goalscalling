class User {
  late final String id;
  late final String image;
  late final String logoImage;
  late final String firstName;
  late final String lastName;
  late final String userTypeId;
  late final String email;
  late final String emailVerifiedAt;
  late final String phone;
  late final String address;
  late final String city;
  late final String stateId;
  late final String zip;
  late final String recordNum;
  late final String organizationId;
  late final String notes;
  late final String lastLogin;
  late final String isActive;
  late final String inactiveDate;
  late final String createdBy;
  late final String lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  late final String deletedAt;
  late final String fullName;

  User(
      {
        required this.id,
        required this.image,
        required this.logoImage,
        required this.firstName,
        required this.lastName,
        required this.userTypeId,
        required this.email,
        required this.emailVerifiedAt,
        required this.phone,
        required this.address,
        required this.city,
        required this.stateId,
        required this.zip,
        required this.recordNum,
        required this.organizationId,
        required this.notes,
        required this.lastLogin,
        required this.isActive,
        required this.inactiveDate,
        required this.createdBy,
        required this.lastModifiedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.fullName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    image = json['image'].toString();
    logoImage = json['logo_image'].toString();
    firstName = json['first_name'].toString();
    lastName = json['last_name'].toString();
    userTypeId = json['user_type_id'].toString();
    email = json['email'].toString();
    emailVerifiedAt = json['email_verified_at'].toString();
    phone = json['phone'].toString();
    address = json['address'].toString();
    city = json['city'].toString();
    stateId = json['state_id'].toString();
    zip = json['zip'].toString();
    recordNum = json['record_num'].toString();
    organizationId = json['organization_id'].toString();
    notes = json['notes'].toString();
    lastLogin = json['last_login'].toString();
    isActive = json['is_active'].toString();
    inactiveDate = json['inactive_date'].toString();
    createdBy = json['created_by'].toString();
    lastModifiedBy = json['last_modified_by'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
    fullName = json['full_name'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['logo_image'] = this.logoImage;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_type_id'] = this.userTypeId;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state_id'] = this.stateId;
    data['zip'] = this.zip;
    data['record_num'] = this.recordNum;
    data['organization_id'] = this.organizationId;
    data['notes'] = this.notes;
    data['last_login'] = this.lastLogin;
    data['is_active'] = this.isActive;
    data['inactive_date'] = this.inactiveDate;
    data['created_by'] = this.createdBy;
    data['last_modified_by'] = this.lastModifiedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['full_name'] = this.fullName;
    return data;
  }
}
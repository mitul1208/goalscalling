class NotificationsModel {
  String eventId;
  String eventType;
  String eventName;
  String notificationTitle;
  String notificationBody;
  UserFrom from;
  String to;
  String goalId;
  String goalActivityId;
  String createdAt;
  String updatedAt;
  String sentAt;

  NotificationsModel(
      {this.eventId,
      this.eventType,
      this.eventName,
      this.notificationTitle,
      this.notificationBody,
      this.from,
      this.to,
      this.goalId,
      this.goalActivityId,
      this.createdAt,
      this.updatedAt,
      this.sentAt});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'].toString();
    eventType = json['event_type'].toString();
    eventName = json['event_name'].toString();
    notificationTitle = json['notification_title'].toString();
    notificationBody = json['notification_body'].toString();

    to = json['to'].toString();
    goalId = json['goal_id'].toString();
    goalActivityId = json['goal_activity_id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    sentAt = json['sent_at'].toString();
    from = json['from'] != null ? new UserFrom.fromJson(json['from']) : null;
  }
}

class UserFrom {
  String id;
  String image;
  String logoImage;
  String firstName;
  String lastName;
  String userTypeId;
  String email;
  String emailVerifiedAt;
  String phone;
  String address;
  String city;
  String stateId;
  String zip;
  String recordNum;
  String organizationId;
  String notes;
  String lastLogin;
  String isActive;
  String inactiveDate;
  String createdBy;
  String lastModifiedBy;
  String deviceToken;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String fullName;

  UserFrom(
      {this.id,
      this.image,
      this.logoImage,
      this.firstName,
      this.lastName,
      this.userTypeId,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.address,
      this.city,
      this.stateId,
      this.zip,
      this.recordNum,
      this.organizationId,
      this.notes,
      this.lastLogin,
      this.isActive,
      this.inactiveDate,
      this.createdBy,
      this.lastModifiedBy,
      this.deviceToken,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.fullName});

  UserFrom.fromJson(Map<String, dynamic> json) {
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
    deviceToken = json['device_token'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
    fullName = json['full_name'].toString();
  }
}

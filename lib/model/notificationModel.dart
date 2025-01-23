class NotificationsModel {
  late final String eventId;
  late final String eventType;
  late final String eventName;
  late final String notificationTitle;
  late final String notificationBody;
  late final UserFrom from;
  late final String to;
  late final String goalId;
  late final String goalActivityId;
  late final String createdAt;
  late final String updatedAt;
  late final String sentAt;

  NotificationsModel(
      {
        required this.eventId,
        required this.eventType,
        required this.eventName,
        required this.notificationTitle,
        required this.notificationBody,
        required this.from,
        required this.to,
        required this.goalId,
        required this.goalActivityId,
        required this.createdAt,
        required this.updatedAt,
        required this.sentAt});

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
    from = json['from'] != null ? new UserFrom.fromJson(json['from']) : UserFrom.fromJson({});
  }
}

class UserFrom {
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
  late final String deviceToken;
  late final String createdAt;
  late final String updatedAt;
  late final String deletedAt;
  late final String fullName;

  UserFrom(
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
        required this.deviceToken,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.fullName});

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

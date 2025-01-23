class GoalModel {
  late final String id;
  late final String name;
  late final String goalStartDate;
  late final String statusId;
  late final String participantId;
  late final String providerId;
  late final String goalChange;
  late final String lastActivityDate;
  late final String goalClosedDate;
  late final String isActive;
  late final String createdBy;
  late final String lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  late final String deletedAt;
  late final String createdTimestamp;
  late final String activitiesAverageScore;
  late final LatestActivity latestActivity;

  GoalModel(
      {
        required this.id,
        required this.name,
        required this.goalStartDate,
        required this.statusId,
        required this.participantId,
        required this.providerId,
        required this.goalChange,
        required this.lastActivityDate,
        required this.goalClosedDate,
        required this.isActive,
        required this.createdBy,
        required this.lastModifiedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.createdTimestamp,
        required this.activitiesAverageScore,
        required this.latestActivity});

  GoalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    goalStartDate = json['goal_start_date'].toString();
    statusId = json['status_id'].toString();
    participantId = json['participant_id'].toString();
    providerId = json['provider_id'].toString();
    goalChange = json['goal_change'].toString();
    lastActivityDate = json['last_activity_date'].toString();
    goalClosedDate = json['goal_closed_date'].toString();
    isActive = json['is_active'].toString();
    createdBy = json['created_by'].toString();
    lastModifiedBy = json['last_modified_by'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
    createdTimestamp = json['created_timestamp'].toString();
    activitiesAverageScore = json['activities_average_score'].toString();
     latestActivity = json['last_activity'] != null
        ? new LatestActivity.fromJson(json['last_activity'])
        : LatestActivity.fromJson({});
  }

 
}

class LatestActivity {
  late final String id;
  late final String goalId;
  late final String updateText;
  late final String activityRanking;
  late final String participantId;
  late final String dateOfActivity;
  late final String parentActivityId;
  late final String isActive;
  late final String createdBy;
  late final String lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  late final String deletedAt;
  late final Owner owner;

  LatestActivity(
      {
        required this.id,
        required this.goalId,
        required this.updateText,
        required this.activityRanking,
        required this.participantId,
        required this.dateOfActivity,
        required this.parentActivityId,
        required this.isActive,
        required this.createdBy,
        required this.lastModifiedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.owner});

  LatestActivity.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    goalId = json['goal_id'].toString();
    updateText = json['update_text'].toString();
    activityRanking = json['activity_ranking'].toString();
    participantId = json['participant_id'].toString();
    dateOfActivity = json['date_of_activity'].toString();
    parentActivityId = json['parent_activity_id'].toString();
    isActive = json['is_active'].toString();
    createdBy = json['created_by'].toString();
    lastModifiedBy = json['last_modified_by'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
    owner = json['owner'] != String ? new Owner.fromJson(json['owner']) : Owner.fromJson({});
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goal_id'] = this.goalId;
    data['update_text'] = this.updateText;
    data['activity_ranking'] = this.activityRanking;
    data['participant_id'] = this.participantId;
    data['date_of_activity'] = this.dateOfActivity;
    data['parent_activity_id'] = this.parentActivityId;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['last_modified_by'] = this.lastModifiedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.owner != String) {
      data['owner'] = this.owner.toJson();
    }
    return data;
  }
}

class Owner {
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

  Owner(
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

  Owner.fromJson(Map<String, dynamic> json) {
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
    data['device_token'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['full_name'] = this.fullName;
    return data;
  }
}
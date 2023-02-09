class GoalModel {
  String id;
  String name;
  String goalStartDate;
  String statusId;
  String participantId;
  String providerId;
  String goalChange;
  String lastActivityDate;
  String goalClosedDate;
  String isActive;
  String createdBy;
  String lastModifiedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String createdTimestamp;
  String activitiesAverageScore;
  LatestActivity latestActivity;

  GoalModel(
      {this.id,
        this.name,
        this.goalStartDate,
        this.statusId,
        this.participantId,
        this.providerId,
        this.goalChange,
        this.lastActivityDate,
        this.goalClosedDate,
        this.isActive,
        this.createdBy,
        this.lastModifiedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.createdTimestamp,
        this.activitiesAverageScore,
        this.latestActivity});

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
        : null;
  }

 
}

class LatestActivity {
  String id;
  String goalId;
  String updateText;
  String activityRanking;
  String participantId;
  String dateOfActivity;
  String parentActivityId;
  String isActive;
  String createdBy;
  String lastModifiedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;
  Owner owner;

  LatestActivity(
      {this.id,
        this.goalId,
        this.updateText,
        this.activityRanking,
        this.participantId,
        this.dateOfActivity,
        this.parentActivityId,
        this.isActive,
        this.createdBy,
        this.lastModifiedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.owner});

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
    owner = json['owner'] != String ? new Owner.fromJson(json['owner']) : String;
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

  Owner(
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
class GoalDetailsModel {
  late final String status;
  late final String msg;
  late final List<Activities> activities;
  late final GoalDetail goalDetail;
  late final List<GraphData> graphData;
  late final List<dynamic> xaxis;
  late final List<dynamic> yaxis;

  GoalDetailsModel(
      {required this.status,
        required this.msg,
        required this.activities,
        required this.goalDetail,
        required this.graphData,
        required this.xaxis,
        required this.yaxis});

  GoalDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'].toString();
    msg = json['msg'].toString();
    if (json['activities'] != null) {
      activities = [];
      json['activities'].forEach((v) {
        activities.add(new Activities.fromJson(v));
      });
    }
    goalDetail = json['goal_detail'] != null
        ? new GoalDetail.fromJson(json['goal_detail'])
        : GoalDetail.fromJson({});
    if (json['graphData'] != null) {
      graphData = [];
      json['graphData'].forEach((v) {
        graphData.add(new GraphData.fromJson(v));
      });
    }
    xaxis = json['xaxis'];
    yaxis = json['yaxis'];
  }

}

class Activities {
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
  late final List<ChildActivities> childActivities;
  late final List<Attachments> attachments;

  Activities(
      {required this.id,
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
        required this.owner,
        required this.childActivities,
        required this.attachments});

  Activities.fromJson(Map<String, dynamic> json) {
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
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : Owner.fromJson({});
    if (json['child_activities'] != null) {
      childActivities = [];
      json['child_activities'].forEach((v) {
        childActivities.add(new ChildActivities.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      attachments = [];
      json['attachments'].forEach((v) {
        attachments.add(new Attachments.fromJson(v));
      });
    }
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
  late final UserType userType;

  Owner(
      {required this.id,
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
        required this.fullName,required this.userType});

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
       userType = json['user_type'] != null
        ? new UserType.fromJson(json['user_type'])
        : UserType.fromJson({});
  }

}

class UserType {
  late final String id;
  late final String name;
  late final String isActive;
  late final String createdBy;
  late final String lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  late final String deletedAt;

  UserType(
      {required this.id,
      required this.name,
      required this.isActive,
      required this.createdBy,
      required this.lastModifiedBy,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt});

  UserType.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    isActive = json['is_active'].toString();
    createdBy = json['created_by'].toString();
    lastModifiedBy = json['last_modified_by'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
  }

}
class ChildActivities {
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
  late final List<Attachments> attachments;
  ChildActivities(
      {required this.id,
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
        required this.owner,
        required this.deletedAt,
        required this.attachments});

  ChildActivities.fromJson(Map<String, dynamic> json) {
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
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : Owner.fromJson({});
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
       if (json['attachments'] != null) {
      attachments = [];
      json['attachments'].forEach((v) {
        attachments.add(new Attachments.fromJson(v));
      });
    }
  }

}

class Attachments {
  late final String id;
  late final String name;
  late final String goalActivityId;
  late final String isActive;
  late final String createdBy;
  late final String lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  late final String deletedAt;

  Attachments(
      {
        required this.id,
        required this.name,
        required this.goalActivityId,
        required this.isActive,
        required this.createdBy,
        required this.lastModifiedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt});

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    goalActivityId = json['goal_activity_id'].toString();
    isActive = json['is_active'].toString();
    createdBy = json['created_by'].toString();
    lastModifiedBy = json['last_modified_by'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
  }

}

class GoalDetail {
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
  late final List<Scales> scales;
  late final List<Activities> activities;

  GoalDetail(
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
        required this.scales,
        required this.activities});

  GoalDetail.fromJson(Map<String, dynamic> json) {
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
    if (json['scales'] != null) {
      scales =  [];
      json['scales'].forEach((v) {
        scales.add(new Scales.fromJson(v));
      });
    }
    if (json['activities'] != null) {
      activities = [];
      json['activities'].forEach((v) {
        activities.add(new Activities.fromJson(v));
      });
    }
  }

}

class Scales {
  late final String id;
  late final String goalId;
  late final String value;
  late final String name;
  late final String description;
  late final String isActive;
  late final String createdBy;
  late final String lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  late final String deletedAt;

  Scales(
      {
        required this.id,
        required this.goalId,
        required this.value,
        required this.name,
        required this.description,
        required this.isActive,
        required this.createdBy,
        required this.lastModifiedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt});

  Scales.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    goalId = json['goal_id'].toString();
    value = json['value'].toString();
    name = json['name'].toString();
    description = json['description'].toString();
    isActive = json['is_active'].toString();
    createdBy = json['created_by'].toString();
    lastModifiedBy = json['last_modified_by'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
  }


}

class GraphData {
  late final String y;
  late final String color;
  late final String name;
  late final String toolInfo;

  GraphData({required this.y,required this.color,required this.name,required this.toolInfo});

  GraphData.fromJson(Map<String, dynamic> json) {
    y = json['y'].toString();
    color = json['color'].toString();
    name = json['name'].toString();
    toolInfo = json['toolInfo'].toString();
  }

}
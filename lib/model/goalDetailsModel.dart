class GoalDetailsModel {
  String status;
  String msg;
  List<Activities> activities;
  GoalDetail goalDetail;
  List<GraphData> graphData;
  List<dynamic> xaxis;
  List<dynamic> yaxis;

  GoalDetailsModel(
      {this.status,
        this.msg,
        this.activities,
        this.goalDetail,
        this.graphData,
        this.xaxis,
        this.yaxis});

  GoalDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'].toString();
    msg = json['msg'].toString();
    if (json['activities'] != null) {
      activities = new List<Activities>();
      json['activities'].forEach((v) {
        activities.add(new Activities.fromJson(v));
      });
    }
    goalDetail = json['goal_detail'] != null
        ? new GoalDetail.fromJson(json['goal_detail'])
        : null;
    if (json['graphData'] != null) {
      graphData = new List<GraphData>();
      json['graphData'].forEach((v) {
        graphData.add(new GraphData.fromJson(v));
      });
    }
    xaxis = json['xaxis'];
    yaxis = json['yaxis'];
  }

}

class Activities {
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
  List<ChildActivities> childActivities;
  List<Attachments> attachments;

  Activities(
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
        this.owner,
        this.childActivities,
        this.attachments});

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
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    if (json['child_activities'] != null) {
      childActivities = new List<ChildActivities>();
      json['child_activities'].forEach((v) {
        childActivities.add(new ChildActivities.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      attachments = new List<Attachments>();
      json['attachments'].forEach((v) {
        attachments.add(new Attachments.fromJson(v));
      });
    }
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
  UserType userType;

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
        this.fullName,this.userType});

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
        : null;
  }

}

class UserType {
  String id;
  String name;
  String isActive;
  String createdBy;
  String lastModifiedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;

  UserType(
      {this.id,
      this.name,
      this.isActive,
      this.createdBy,
      this.lastModifiedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

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
List<Attachments> attachments;
  ChildActivities(
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
        this.owner,
        this.deletedAt,
        this.attachments});

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
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
       if (json['attachments'] != null) {
      attachments = new List<Attachments>();
      json['attachments'].forEach((v) {
        attachments.add(new Attachments.fromJson(v));
      });
    }
  }

}

class Attachments {
  String id;
  String name;
  String goalActivityId;
  String isActive;
  String createdBy;
  String lastModifiedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Attachments(
      {this.id,
        this.name,
        this.goalActivityId,
        this.isActive,
        this.createdBy,
        this.lastModifiedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

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
  List<Scales> scales;
  List<Activities> activities;

  GoalDetail(
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
        this.scales,
        this.activities});

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
      scales = new List<Scales>();
      json['scales'].forEach((v) {
        scales.add(new Scales.fromJson(v));
      });
    }
    if (json['activities'] != null) {
      activities = new List<Activities>();
      json['activities'].forEach((v) {
        activities.add(new Activities.fromJson(v));
      });
    }
  }

}

class Scales {
  String id;
  String goalId;
  String value;
  String name;
  String description;
  String isActive;
  String createdBy;
  String lastModifiedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Scales(
      {this.id,
        this.goalId,
        this.value,
        this.name,
        this.description,
        this.isActive,
        this.createdBy,
        this.lastModifiedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

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
  String y;
  String color;
  String name;
  String toolInfo;

  GraphData({this.y, this.color, this.name, this.toolInfo});

  GraphData.fromJson(Map<String, dynamic> json) {
    y = json['y'].toString();
    color = json['color'].toString();
    name = json['name'].toString();
    toolInfo = json['toolInfo'].toString();
  }

}
import 'package:flutter_searchabledropdown/model/ProviderList.dart';

class ParticipantListModel {
  int status;
  String msg;
  List<Participants> participants;

  ParticipantListModel({this.status, this.msg, this.participants});

  ParticipantListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['participants'] != null) {
      participants = new List<Participants>();
      json['participants'].forEach((v) {
        participants.add(new Participants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.participants != null) {
      data['participants'] = this.participants.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Participants {
  int id;
  int participantId;
  int providerId;
  int programId;
  String isActive;
  int createdBy;
  Null lastModifiedBy;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  Participant participant;

  Participants(
      {this.id,
      this.participantId,
      this.providerId,
      this.programId,
      this.isActive,
      this.createdBy,
      this.lastModifiedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.participant});

  Participants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    participantId = json['participant_id'];
    providerId = json['provider_id'];
    programId = json['program_id'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    lastModifiedBy = json['last_modified_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    participant = json['participant'] != null
        ? new Participant.fromJson(json['participant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['participant_id'] = this.participantId;
    data['provider_id'] = this.providerId;
    data['program_id'] = this.programId;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['last_modified_by'] = this.lastModifiedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.participant != null) {
      data['participant'] = this.participant.toJson();
    }
    return data;
  }
}

class Participant {
  int id;
  String image;
  String logoImage;
  String firstName;
  String lastName;
  int userTypeId;
  String email;
  String emailVerifiedAt;
  String phone;
  String address;
  String city;
  int stateId;
  String zip;
  String ethnicity;
  String recordNum;
  int organizationId;
  String notes;
  String lastLogin;
  String isActive;
  String inactiveDate;
  int createdBy;
  int lastModifiedBy;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String deviceToken;
  String fullName;
  UserDetail userDetail;

  Participant(
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
      this.ethnicity,
      this.recordNum,
      this.organizationId,
      this.notes,
      this.lastLogin,
      this.isActive,
      this.inactiveDate,
      this.createdBy,
      this.lastModifiedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.deviceToken,
      this.fullName,
      this.userDetail});

  Participant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    logoImage = json['logo_image'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userTypeId = json['user_type_id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    stateId = json['state_id'];
    zip = json['zip'];
    ethnicity = json['ethnicity'];
    recordNum = json['record_num'];
    organizationId = json['organization_id'];
    notes = json['notes'];
    lastLogin = json['last_login'];
    isActive = json['is_active'];
    inactiveDate = json['inactive_date'];
    createdBy = json['created_by'];
    lastModifiedBy = json['last_modified_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    deviceToken = json['device_token'];
    fullName = json['full_name'];
    userDetail = json['user_detail'] != null
        ? new UserDetail.fromJson(json['user_detail'])
        : null;
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
    data['ethnicity'] = this.ethnicity;
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
    data['device_token'] = this.deviceToken;
    data['full_name'] = this.fullName;
    if (this.userDetail != null) {
      data['user_detail'] = this.userDetail.toJson();
    }
    return data;
  }
}

class UserDetail {
  int id;
  String gender;
  int userId;
  String dob;
  String programId;
  String providerId;
  int providerTypeId;
  String numUsers;
  String numProviders;
  String numGoals;
  int numUsersGoals;
  String avgGoalChange;
  int createdBy;
  int lastModifiedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;

  UserDetail(
      {this.id,
      this.gender,
      this.userId,
      this.dob,
      this.programId,
      this.providerId,
      this.providerTypeId,
      this.numUsers,
      this.numProviders,
      this.numGoals,
      this.numUsersGoals,
      this.avgGoalChange,
      this.createdBy,
      this.lastModifiedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
    userId = json['user_id'];
    dob = json['dob'];
    programId = json['program_id'];
    providerId = json['provider_id'];
    providerTypeId = json['provider_type_id'];
    numUsers = json['num_users'];
    numProviders = json['num_providers'];
    numGoals = json['num_goals'];
    numUsersGoals = json['num_users_goals'];
    avgGoalChange = json['avg_goal_change'].toString();
    createdBy = json['created_by'];
    lastModifiedBy = json['last_modified_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gender'] = this.gender;
    data['user_id'] = this.userId;
    data['dob'] = this.dob;
    data['program_id'] = this.programId;
    data['provider_id'] = this.providerId;
    data['provider_type_id'] = this.providerTypeId;
    data['num_users'] = this.numUsers;
    data['num_providers'] = this.numProviders;
    data['num_goals'] = this.numGoals;
    data['num_users_goals'] = this.numUsersGoals;
    data['avg_goal_change'] = this.avgGoalChange;
    data['created_by'] = this.createdBy;
    data['last_modified_by'] = this.lastModifiedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

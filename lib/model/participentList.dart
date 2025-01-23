
class ParticipantListModel {
  late final int status;
  late final String msg;
  late final List<Participants> participants;

  ParticipantListModel({required this.status,required this.msg,required this.participants});

  ParticipantListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['participants'] != null) {
      participants = [];
      json['participants'].forEach((v) {
        participants.add(new Participants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['participants'] = this.participants.map((v) => v.toJson()).toList();
      return data;
  }
}

class Participants {
  late final int id;
  late final int participantId;
  late final int providerId;
  late final int programId;
  late final String isActive;
  late final int createdBy;
  String? lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  String? deletedAt;
  late final Participant participant;

  Participants(
      {
        required this.id,
        required this.participantId,
        required this.providerId,
        required this.programId,
        required this.isActive,
        required this.createdBy,
        required this.lastModifiedBy,
        required this.createdAt,
        required this.updatedAt,
      this.deletedAt,
        required this.participant});

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
        : Participant.fromJson({});
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
    data['participant'] = this.participant.toJson();
      return data;
  }
}

class Participant {
  late final int id;
  late final String image;
  late final String logoImage;
  late final String firstName;
  late final String lastName;
  late final int userTypeId;
  late final String email;
  late final String emailVerifiedAt;
  late final String phone;
  late final String address;
  late final String city;
  late final int stateId;
  late final String zip;
  late final String ethnicity;
  late final String recordNum;
  late final int organizationId;
  late final String notes;
  late final String lastLogin;
  late final String isActive;
  late final String inactiveDate;
  late final int createdBy;
  late final int lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  Null deletedAt;
  late final String deviceToken;
  late final String fullName;
  late final UserDetail userDetail;

  Participant(
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
        required this.ethnicity,
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
        required this.deviceToken,
        required this.fullName,
        required this.userDetail});

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
        : UserDetail.fromJson({});
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
    data['user_detail'] = this.userDetail.toJson();
      return data;
  }
}

class UserDetail {
  late final int id;
  late final String gender;
  late final int userId;
  late final String dob;
  late final String programId;
  late final String providerId;
  late final int providerTypeId;
  late final String numUsers;
  late final String numProviders;
  late final String numGoals;
  late final int numUsersGoals;
  late final String avgGoalChange;
  late final int createdBy;
  late final int lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  late final String deletedAt;

  UserDetail(
      {
        required this.id,
        required this.gender,
        required this.userId,
        required this.dob,
        required this.programId,
        required this.providerId,
        required this.providerTypeId,
        required this.numUsers,
        required this.numProviders,
        required this.numGoals,
        required this.numUsersGoals,
        required this.avgGoalChange,
        required this.createdBy,
        required this.lastModifiedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt});

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

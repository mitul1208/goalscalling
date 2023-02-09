class ProviderListModel {
  int status;
  String msg;
  List<Providers> providers;

  ProviderListModel({this.status, this.msg, this.providers});

  ProviderListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['providers'] != null) {
      providers = new List<Providers>();
      json['providers'].forEach((v) {
        providers.add(new Providers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.providers != null) {
      data['providers'] = this.providers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Providers {
  int id;
  int providerId;
  int supervisorId;
  int programId;
  String isActive;
  int createdBy;
  int lastModifiedBy;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  List<Programs> programs;
  Provider provider;

  Providers(
      {this.id,
      this.providerId,
      this.supervisorId,
      this.programId,
      this.isActive,
      this.createdBy,
      this.lastModifiedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.programs,
      this.provider});

  Providers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerId = json['provider_id'];
    supervisorId = json['supervisor_id'];
    programId = json['program_id'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    lastModifiedBy = json['last_modified_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['programs'] != null) {
      programs = new List<Programs>();
      json['programs'].forEach((v) {
        programs.add(new Programs.fromJson(v));
      });
    }
    provider = json['provider'] != null
        ? new Provider.fromJson(json['provider'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provider_id'] = this.providerId;
    data['supervisor_id'] = this.supervisorId;
    data['program_id'] = this.programId;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['last_modified_by'] = this.lastModifiedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.programs != null) {
      data['programs'] = this.programs.map((v) => v.toJson()).toList();
    }
    if (this.provider != null) {
      data['provider'] = this.provider.toJson();
    }
    return data;
  }
}

class Programs {
  int id;
  int programId;
  int providerId;
  Null createdBy;
  int lastModifiedBy;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  Program program;

  Programs(
      {this.id,
      this.programId,
      this.providerId,
      this.createdBy,
      this.lastModifiedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.program});

  Programs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    programId = json['program_id'];
    providerId = json['provider_id'];
    createdBy = json['created_by'];
    lastModifiedBy = json['last_modified_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    program =
        json['program'] != null ? new Program.fromJson(json['program']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['program_id'] = this.programId;
    data['provider_id'] = this.providerId;
    data['created_by'] = this.createdBy;
    data['last_modified_by'] = this.lastModifiedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.program != null) {
      data['program'] = this.program.toJson();
    }
    return data;
  }
}

class Program {
  int id;
  String image;
  String name;
  int organizationId;
  Null contactEmail;
  Null contactPhone;
  Null address;
  Null city;
  Null stateId;
  Null zip;
  int countryId;
  Null notes;
  String dateAdded;
  Null recordNum;
  String isActive;
  Null createdBy;
  int lastModifiedBy;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  Program(
      {this.id,
      this.image,
      this.name,
      this.organizationId,
      this.contactEmail,
      this.contactPhone,
      this.address,
      this.city,
      this.stateId,
      this.zip,
      this.countryId,
      this.notes,
      this.dateAdded,
      this.recordNum,
      this.isActive,
      this.createdBy,
      this.lastModifiedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Program.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    organizationId = json['organization_id'];
    contactEmail = json['contact_email'];
    contactPhone = json['contact_phone'];
    address = json['address'];
    city = json['city'];
    stateId = json['state_id'];
    zip = json['zip'];
    countryId = json['country_id'];
    notes = json['notes'];
    dateAdded = json['date_added'];
    recordNum = json['record_num'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    lastModifiedBy = json['last_modified_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['organization_id'] = this.organizationId;
    data['contact_email'] = this.contactEmail;
    data['contact_phone'] = this.contactPhone;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state_id'] = this.stateId;
    data['zip'] = this.zip;
    data['country_id'] = this.countryId;
    data['notes'] = this.notes;
    data['date_added'] = this.dateAdded;
    data['record_num'] = this.recordNum;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['last_modified_by'] = this.lastModifiedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Provider {
  int id;
  String image;
  String logoImage;
  String firstName;
  String lastName;
  int userTypeId;
  String email;
  Null emailVerifiedAt;
  String phone;
  String address;
  String city;
  int stateId;
  String zip;
  Null ethnicity;
  String recordNum;
  int organizationId;
  Null notes;
  String lastLogin;
  String isActive;
  Null inactiveDate;
  int createdBy;
  int lastModifiedBy;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String deviceToken;
  String fullName;
  UserDetail userDetail;

  Provider(
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

  Provider.fromJson(Map<String, dynamic> json) {
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
  Null gender;
  int userId;
  Null dob;
  int programId;
  Null providerId;
  int providerTypeId;
  int numUsers;
  int numProviders;
  int numGoals;
  int numUsersGoals;
  String avgGoalChange;
  int createdBy;
  int lastModifiedBy;
  String createdAt;
  String updatedAt;
  Null deletedAt;

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

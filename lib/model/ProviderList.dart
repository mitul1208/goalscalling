class ProviderListModel {
  late final int status;
  late final String msg;
  late final List<Providers> providers;

  ProviderListModel({required this.status,required this.msg,required this.providers});

  ProviderListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['providers'] != null) {
      providers = [];
      json['providers'].forEach((v) {
        providers.add(new Providers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['providers'] = this.providers.map((v) => v.toJson()).toList();
      return data;
  }
}

class Providers {
  late final int id;
  late final int providerId;
  late final int supervisorId;
  late final int programId;
  late final String isActive;
  late final int createdBy;
  late final int lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  Null deletedAt;
  late final List<Programs> programs;
  late final Provider provider;

  Providers(
      {
        required this.id,
        required this.providerId,
        required this.supervisorId,
        required this.programId,
        required this.isActive,
        required this.createdBy,
        required this.lastModifiedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.programs,
        required this.provider});

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
      programs = [];
      json['programs'].forEach((v) {
        programs.add(new Programs.fromJson(v));
      });
    }
    provider = (json['provider'] != null
        ? new Provider.fromJson(json['provider'])
        : Provider.fromJson({}));
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
    data['programs'] = this.programs.map((v) => v.toJson()).toList();
    data['provider'] = this.provider.toJson();
      return data;
  }
}

class Programs {
  late final int id;
  late final int programId;
  late final int providerId;
  Null createdBy;
  late final int lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  Null deletedAt;
  late final Program program;

  Programs(
      {required this.id,
        required this.programId,
        required this.providerId,
        required this.createdBy,
        required this.lastModifiedBy,
        required this.createdAt,
        required this.updatedAt,
      this.deletedAt,
        required this.program});

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
        json['program'] != null ? new Program.fromJson(json['program']) : Program.fromJson({});
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
    data['program'] = this.program.toJson();
      return data;
  }
}

class Program {
  late final int id;
  late final String image;
  late final String name;
  late final int organizationId;
  Null contactEmail;
  Null contactPhone;
  Null address;
  Null city;
  Null stateId;
  Null zip;
  late final int countryId;
  Null notes;
  late final String dateAdded;
  Null recordNum;
  late final String isActive;
  Null createdBy;
  late final int lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  Null deletedAt;

  Program(
      {required this.id,
        required this.image,
        required this.name,
        required this.organizationId,
      this.contactEmail,
      this.contactPhone,
      this.address,
      this.city,
      this.stateId,
      this.zip,
        required this.countryId,
      this.notes,
        required this.dateAdded,
      this.recordNum,
        required this.isActive,
      this.createdBy,
        required this.lastModifiedBy,
        required this.createdAt,
        required this.updatedAt,
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
  late final int id;
  late final String image;
  late final String logoImage;
  late final String firstName;
  late final String lastName;
  late final int userTypeId;
  late final String email;
  Null emailVerifiedAt;
  late final String phone;
  late final String address;
  late final String city;
  late final int stateId;
  late final String zip;
  Null ethnicity;
  late final String recordNum;
  late final int organizationId;
  Null notes;
  late final String lastLogin;
  late final String isActive;
  Null inactiveDate;
  late final int createdBy;
  late final int lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  Null deletedAt;
  late final String deviceToken;
  late final String fullName;
  late final UserDetail userDetail;

  Provider(
      {
        required this.id,
        required this.image,
        required this.logoImage,
        required this.firstName,
        required this.lastName,
        required this.userTypeId,
        required this.email,
      this.emailVerifiedAt,
        required this.phone,
        required this.address,
        required this.city,
        required this.stateId,
        required this.zip,
      this.ethnicity,
        required this.recordNum,
        required this.organizationId,
      this.notes,
        required this.lastLogin,
        required this.isActive,
      this.inactiveDate,
        required this.createdBy,
        required this.lastModifiedBy,
        required this.createdAt,
        required this.updatedAt,
      this.deletedAt,
        required this.deviceToken,
        required this.fullName,
        required this.userDetail});

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
  Null gender;
  late final int userId;
  Null dob;
  late final int programId;
  Null providerId;
  late final int providerTypeId;
  late final int numUsers;
  late final int numProviders;
  late final int numGoals;
  late final int numUsersGoals;
  late final String avgGoalChange;
  late final int createdBy;
  late final int lastModifiedBy;
  late final String createdAt;
  late final String updatedAt;
  Null deletedAt;

  UserDetail(
      {required this.id,
      this.gender,
        required this.userId,
      this.dob,
        required this.programId,
      this.providerId,
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

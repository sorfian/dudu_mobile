part of 'models.dart';

class TransactionTalentDetails extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? profile_photo_path;
  final int? balance;
  final String? phone_number;
  final String? social_media;
  final String? socmed_detail;
  final int? total_followers;
  final String? company;
  final String? web_linkedin;
  final String? partner_role;
  final String? industry;
  final String? npwp;
  final String? city;
  final String? description;
  final int? is_joined;
  final int? is_active;
  final String? role;
  static String? token;

  TransactionTalentDetails({
    this.id,
    this.name,
    this.email,
    this.password,
    this.profile_photo_path,
    this.balance,
    this.phone_number,
    this.social_media,
    this.socmed_detail,
    this.total_followers,
    this.company,
    this.web_linkedin,
    this.partner_role,
    this.industry,
    this.npwp,
    this.city,
    this.description,
    this.is_joined,
    this.is_active,
    this.role,
  });

  factory TransactionTalentDetails.fromJson(Map<String, dynamic> data) =>
      TransactionTalentDetails(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        profile_photo_path: data['profile_photo_path'],
        balance: data['balance'],
        phone_number: data['phone_number'],
        social_media: data['social_media'],
        socmed_detail: data['socmed_detail'],
        total_followers: data['total_followers'],
        company: data['company'],
        web_linkedin: data['web_linkedin'],
        partner_role: data['partner_role'],
        industry: data['industry'],
        npwp: data['npwp'],
        city: data['city'],
        description: data['description'],
        is_active: data['is_active'],
      );

  TransactionTalentDetails copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? profile_photo_path,
    int? balance,
    String? phone_number,
    String? social_media,
    String? socmed_detail,
    int? total_followers,
    String? company,
    String? web_linkedin,
    String? partner_role,
    String? industry,
    String? npwp,
    String? city,
    String? description,
    int? is_joined,
    int? is_active,
    String? role,
  }) =>
      TransactionTalentDetails(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        profile_photo_path: profile_photo_path ?? this.profile_photo_path,
        balance: balance ?? this.balance,
        phone_number: phone_number ?? this.phone_number,
        social_media: social_media ?? this.social_media,
        socmed_detail: socmed_detail ?? this.socmed_detail,
        total_followers: total_followers ?? this.total_followers,
        company: company ?? this.company,
        web_linkedin: web_linkedin ?? this.web_linkedin,
        partner_role: partner_role ?? this.partner_role,
        industry: industry ?? this.industry,
        npwp: npwp ?? this.npwp,
        city: city ?? this.city,
        description: description ?? this.description,
        is_joined: is_joined ?? this.is_joined,
        is_active: is_active ?? this.is_active,
        role: role ?? this.role,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        profile_photo_path,
        balance,
        phone_number,
        social_media,
        socmed_detail,
        total_followers,
        company,
        web_linkedin,
        partner_role,
        industry,
        npwp,
        city,
        description,
        is_active,
        is_joined,
        role,
      ];
}

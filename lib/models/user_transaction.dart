part of 'models.dart';

enum UserTransactionStatus { on_process, success, pending, cancelled }

class UserTransaction extends Equatable {
  final int? id;
  final int? user_id;
  final Talent? talent_id;
  final int? total;
  final UserTransactionStatus? status;
  final String? payment_url;
  final String? name;
  final String? moment;
  final DateTime? birthday_date;
  final int? age;
  final String? occasion;
  final String? instruction;
  final String? detail;
  final User? user;
  final DateTime? date;
  final String? videoPath;
  final String? videoThumbnail;
  final String? externalId;

  UserTransaction({
    this.id,
    this.user_id,
    this.talent_id,
    this.total,
    this.status,
    this.payment_url,
    this.name,
    this.moment,
    this.birthday_date,
    this.age,
    this.occasion,
    this.instruction,
    this.detail,
    this.user,
    this.date,
    this.videoPath,
    this.videoThumbnail,
    this.externalId,
  });

  UserTransaction copyWith({
    int? id,
    int? user_id,
    Talent? talent_id,
    int? total,
    UserTransactionStatus? status,
    String? payment_url,
    String? name,
    String? moment,
    DateTime? birthday_date,
    int? age,
    String? occasion,
    String? instruction,
    String? detail,
    User? user,
    DateTime? date,
    String? videoPath,
    String? videoThumbnail,
    String? externalId,
  }) {
    return UserTransaction(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      talent_id: talent_id ?? this.talent_id,
      total: total ?? this.total,
      status: status ?? this.status,
      payment_url: payment_url ?? this.payment_url,
      name: name ?? this.name,
      moment: moment ?? this.moment,
      birthday_date: birthday_date ?? this.birthday_date,
      age: age ?? this.age,
      occasion: occasion ?? this.occasion,
      instruction: instruction ?? this.instruction,
      detail: detail ?? this.detail,
      user: user ?? this.user,
      date: date ?? this.date,
      videoPath: videoPath ?? this.videoPath,
      videoThumbnail: videoThumbnail ?? this.videoThumbnail,
      externalId: externalId ?? this.externalId,
    );
  }

  factory UserTransaction.fromJson(Map<String, dynamic> data) =>
      UserTransaction(
        id: data['id'],
        // user: User.fromJson(data['user']),
        talent_id: Talent.fromJson(data['talent']),
        total: data['total'],
        name: data['name'],
        moment: data['moment'],
        // birthday_date:
        //     DateTime.fromMillisecondsSinceEpoch(data['birthday_date']),
        date: DateTime.fromMillisecondsSinceEpoch(data['created_at'] * 1000),
        // age: data['age'],
        occasion: data['occasion'],
        instruction: data['instruction'],
        // detail: data['detail'],
        status: (data['status'] == 'PENDING')
            ? UserTransactionStatus.pending
            : (data['status'] == 'SUCCESS')
                ? UserTransactionStatus.success
                : (data['status'] == 'CANCELLED')
                    ? UserTransactionStatus.cancelled
                    : UserTransactionStatus.on_process,
        payment_url: data['payment_url'],
        videoPath: data['video_file'],
        videoThumbnail: data['video_thumbnail'],
        externalId: data['external_id'],
      );

  @override
  List<Object?> get props => [
        id,
        user_id,
        talent_id,
        total,
        status,
        payment_url,
        name,
        moment,
        birthday_date,
        age,
        occasion,
        instruction,
        detail,
        user,
        date,
        videoPath,
        videoThumbnail,
      ];
}

// List<UserTransaction> mockUserTransactions = [
//   UserTransaction(
//     id: 1,
//     user_id: 1,
//     talent_id: mockTalents[1],
//     total: (mockTalents[1].price! * 3 * 1.1).round() + 20000,
//     status: UserTransactionStatus.success,
//     user: mockUser,
//     name: "Fia",
//     moment: "Birthday",
//     birthday_date: DateTime(1994, 1, 9),
//     age: 27,
//     instruction: "Tell her about happy long last",
//     detail: "She is my love",
//     date: DateTime.now(),
//   ),
//   UserTransaction(
//     id: 2,
//     user_id: 1,
//     talent_id: mockTalents[2],
//     total: (mockTalents[2].price! * 2 * 1.1).round() + 20000,
//     status: UserTransactionStatus.on_process,
//     user: mockUser,
//     name: "Saffa",
//     moment: "Birthday",
//     birthday_date: DateTime(2018, 9, 23),
//     age: 3,
//     instruction: "Tell her about play a games in playground",
//     detail: "She is my lovely daughter",
//     date: DateTime.now(),
//   ),
// ];

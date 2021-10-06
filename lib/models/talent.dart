part of 'models.dart';

enum TalentType { normal_video, video_call }

class Talent extends Equatable {
  final int? id;
  final int? user_id;
  final String? name;
  final List<String>? type;
  final String? description;
  final String? picture_path;
  final int? price;
  final double? rate;
  final List<TalentType>? types;
  final User? user;

  Talent({
    this.id,
    this.user_id,
    this.name,
    this.type,
    this.description,
    this.picture_path,
    this.price,
    this.rate,
    this.types,
    this.user,
  });

  factory Talent.fromJson(Map<String, dynamic> data) {
    return Talent(
        id: data['id'],
        user_id: data['user_id'],
        user: (data['user'] != null) ? User.fromJson(data['user']) : User(),
        name: (data['name'] != null) ? data['name'] : "",
        description: data['description'],
        picture_path:
            "https://staging.dudu.co.id/storage/" + data['picture_path'],
        price: data['price'],
        rate: (data['rate'] as num).toDouble(),
        type: data['category'].toString().split(',').map((e) {
          switch (e) {
            case 'actor':
              return "Actors";
            case 'athlete':
              return "Athletes";
            case 'comedian':
              return "Comedians";
            case 'creator':
              return "Content Creators";
            case 'musician':
              return "Musicians";
            case 'politic':
              return "Politics";
            default:
              return "TV Shows";
          }
        }).toList(),
        types: data['type'].toString().split(',').map((e) {
          switch (e) {
            case 'vc':
              return TalentType.video_call;
            case 'normal':
              return TalentType.normal_video;
            default:
              return TalentType.normal_video;
          }
        }).toList());
  }

  @override
  List<Object?> get props => [
        id,
        user_id,
        name,
        type,
        description,
        picture_path,
        price,
        rate,
      ];
}





// List<Talent> mockTalents = [
//   Talent(
//     id: 1,
//     user_id: mockUser,
//     name: "Hugh Jackman",
//     type: "Selebgram",
//     picture_path:
//         "https://images.indianexpress.com/2017/03/logan-review-759.jpg",
//     price: 10000000,
//     rate: 4.9,
//     description:
//         "Hugh Jackman adalah seorang aktor yang membintangi film X-Men di Hollywood. Saat ini ia sedang naik daun.",
//     types: const [TalentType.normal_video],
//   ),
//   Talent(
//     id: 1,
//     user_id: mockUser,
//     name: "Brian Adam",
//     type: "Actors",
//     picture_path:
//         "https://www.sman8denpasar.sch.id/wp-content/uploads/learn-press-profile/4/172522ec1028ab781d9dfd17eaca4427.jpg",
//     price: 300000,
//     rate: 4.4,
//     description:
//         "Brian pernah memenangi Golden Globe sebagai 'Logan' di film X-Men. Tanyakan padanya apa yang ingin kamu ucapkan.",
//     types: const [TalentType.normal_video],
//   ),
//   Talent(
//     id: 1,
//     user_id: mockUser,
//     name: "Tom Holland",
//     type: "Actors",
//     picture_path:
//         "https://www.pinkvilla.com/imageresize/tomh_0.jpg?width=752&format=webp&t=pvorg",
//     price: 10000000,
//     rate: 5.0,
//     description:
//         "Tom Holland adalah seorang bintang muda di film besutan Marver Studio. Tak ada yang tak ingin berfoto bersamanya. Ia adalah seorang superstar.",
//     types: const [TalentType.video_call],
//   ),
//   Talent(
//     id: 1,
//     user_id: mockUser,
//     name: "Laudya Cintya Bella",
//     type: "Actress",
//     picture_path:
//         "https://akcdn.detik.net.id/api/wm/2020/03/18/9685d638-4740-4adb-baeb-b821e12559a1_169.jpeg",
//     price: 4000000,
//     rate: 4.8,
//     description:
//         "Laudya Cintya Bella adalah seorang aktris muslim yang berasal dari Bandung. Sudah lama ia mendalami ilmu agama dan hijrah untuk menggunakan hijab.",
//     types: const [TalentType.video_call, TalentType.normal_video],
//   ),
// ];

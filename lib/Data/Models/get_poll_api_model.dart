class GetPollApiModel {
  final int pollId;
  final String? imageLogo;
  final String imageUrl;
  final String question;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String answer;
  final int pollTypeID;
  final bool isActive;
  final bool isDeleted;
  final int createdBy;
  final String createdOn;

  GetPollApiModel({
    required this.pollId,
    this.imageLogo,
    required this.imageUrl,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.answer,
    required this.pollTypeID,
    required this.isActive,
    required this.isDeleted,
    required this.createdBy,
    required this.createdOn,
  });

  factory GetPollApiModel.fromJson(Map<String, dynamic> json) {
    return GetPollApiModel(
      pollId: json['pollId'],
      imageLogo: json['imageLogo'] ?? '',
      imageUrl: json['imageUrl'],
      question: json['question'],
      optionA: json['optionA'],
      optionB: json['optionB'],
      optionC: json['optionC'],
      optionD: json['optionD'],
      answer: json['answer'],
      pollTypeID: json['pollTypeID'],
      isActive: json['isActive'],
      isDeleted: json['isDeleted'],
      createdBy: json['createdBy'],
      createdOn: json['createdOn'],
    );
  }
}

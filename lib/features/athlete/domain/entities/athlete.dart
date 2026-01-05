class Parent {
  final String id;
  final String name;
  final String profilePicture;
  final String phone;
  final String email;

  Parent({
    required this.id,
    required this.name,
    required this.profilePicture,
    required this.phone,
    required this.email,
  });
}

class Coach {
  final String id;
  final String name;
  final String profilePicture;
  final String phone;
  final String email;

  Coach({
    required this.id,
    required this.name,
    required this.profilePicture,
    required this.phone,
    required this.email,
  });
}

class Athlete {
  final Parent parent;
  final Coach coach;
  final String userId;
  final String parentId;
  final String coachId;
  final String dateOfBirth;
  final String name;
  final String phone;
  final String email;
  final String height;
  final String profilePicture;
  final String gender;
  final String role;

  Athlete({
    required this.parent,
    required this.coach,
    required this.userId,
    required this.parentId,
    required this.coachId,
    required this.dateOfBirth,
    required this.name,
    required this.phone,
    required this.email,
    required this.height,
    required this.profilePicture,
    required this.gender,
    required this.role,
  });
}

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String image;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.image});

  static List<User> users = [
    User(
        id: '1',
        firstName: 'Mohamed',
        lastName: 'Amir',
        image:
            'https://media.istockphoto.com/id/640227938/photo/outdoor-head-and-shoulders-portrait-of-smiling-mature-man.jpg?s=612x612&w=0&k=20&c=PGnPdYArbfHJxqyMnozCkKQUzRYXwMUXtvHzLmUAxHM='),
    User(
        id: '2',
        firstName: 'Ahmed',
        lastName: 'Ibrahim',
        image:
            'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80'),
    User(
        id: '3',
        firstName: 'Ali',
        lastName: 'Islam',
        image:
            'https://media.istockphoto.com/id/1178406585/photo/close-up-portrait-of-man-with-beard-looking-at-camera-with-copy-space-for-text.jpg?s=612x612&w=0&k=20&c=ujUtK1qZJLt5OEcjyvQE0dj6JWPsuEDbUxsmgPKzVho='),
    User(
        id: '4',
        firstName: 'Mahmoud',
        lastName: 'Ahmed',
        image:
            'https://media.istockphoto.com/id/651963672/photo/handsome-man-portrait.jpg?s=612x612&w=0&k=20&c=M8d7c0aECHRnO06dCcVMTQtva9vzJUD-a3pfJNauDNE='),
    User(
        id: '5',
        firstName: 'Noha',
        lastName: 'Abdullah',
        image:
            'https://1.bp.blogspot.com/-lzG-tvv6ewc/YOrfmECusmI/AAAAAAACJJ4/FaDBH6OwL5wWqtqM7Wv1AhklQtZmAC-RwCLcBGAsYHQ/w329-h400/89157a93e3268b45c6881648ab1d0a03.jpg'),
  ];
}

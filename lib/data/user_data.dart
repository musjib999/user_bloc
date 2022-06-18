import 'package:user_bloc/model/user_model.dart';

List<UserModel> users = const [
  UserModel(
    id: 001,
    name: 'Musa Jibirl',
    username: 'musjib999',
    email: 'musjib999@gmail.com',
    address: Address(
      street: 'Takalafia Road',
      suite: 'Tudun Wada',
      city: 'Kaduna',
      zipcode: '800646',
      geo: Geo(lat: '7.248583', lng: '10.3844'),
    ),
    phone: '+2348133144851',
    website: 'https://musjib999@github.io',
    company: Company(
      name: 'Lexington Technologies',
      catchPhrase: 'Lex',
      bs: '',
    ),
  ),
  UserModel(
    id: 001,
    name: 'Mubarak Ibarahim',
    username: 'bags',
    email: 'elbags333@gmail.com',
    address: Address(
      street: 'Gobarau Road',
      suite: 'Unguwan Rimi',
      city: 'Kaduna',
      zipcode: '800646',
      geo: Geo(lat: '7.248583', lng: '10.3844'),
    ),
    phone: '+2348133144851',
    website: 'https://codeswot@github.io',
    company: Company(
      name: 'Palgo Inc',
      catchPhrase: 'Palgo',
      bs: '',
    ),
  )
];

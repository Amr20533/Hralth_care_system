class User{
  final String id,name,username,imageUrl;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.imageUrl,
    // required this.id,
});
  static  List<User> users = [
    User(id: '1', name: 'John', username: 'Whitaker', imageUrl: 'https://images.unsplash.com/photo-1700989348331-180f18e06978?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8fA%3D%3D'),
    User(id: '2', name: 'John', username: 'Whitaker', imageUrl: 'https://images.unsplash.com/photo-1701215097228-188d262c1f6b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0MHx8fGVufDB8fHx8fA%3D%3D'),
    User(id: '3', name: 'John', username: 'Whitaker', imageUrl: 'https://images.unsplash.com/photo-1701455857582-ed916c8c9535?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1M3x8fGVufDB8fHx8fA%3D%3D'),
    User(id: '4', name: 'John', username: 'Whitaker', imageUrl: 'https://images.unsplash.com/photo-1700804217487-55137a47a82f?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2M3x8fGVufDB8fHx8fA%3D%3D'),
    User(id: '5', name: 'John', username: 'Whitaker', imageUrl: 'https://plus.unsplash.com/premium_photo-1697303617233-ec1a75c69c0f?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4N3x8fGVufDB8fHx8fA%3D%3D'),
    User(id: '6', name: 'John', username: 'Whitaker', imageUrl: 'https://images.unsplash.com/photo-1701220291853-99945bcc23d5?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4NHx8fGVufDB8fHx8fA%3D%3D'),
  ];
}
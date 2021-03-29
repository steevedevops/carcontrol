class CarException implements Exception{
  final String message;

  CarException(this.message);
  @override
  String toString(){
    return message;
  }
}
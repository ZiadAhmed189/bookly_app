class Messagess
{
  final String message ;
final String email ;
  Messagess(this.message , this.email);
  factory Messagess.fromjson(data)
  {
    return Messagess(data["message"], data["email"]) ;
  }
}
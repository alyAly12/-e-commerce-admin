class AuthValidator
{
static String? upLoadProdText({String? value, String? toBeReturnedString }){
  if(value!.isEmpty){
    return toBeReturnedString;
  }
  return null;
}
}
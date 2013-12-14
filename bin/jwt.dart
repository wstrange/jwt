
import 'package:jwt/jwt.dart';

void main() {
  var id_token =
"eyAiYWxnIjogIkhTMjU2IiwgImN0eSI6ICJKV1QiLCAidHlwIjogImp3dCIgfQ.eyAidG9rZW5OYW1lIjogImlkX3Rva2VuIiwgImV4cCI6IDEzODcwNTAzMTksICJhenAiOiAiY2xpZW50IiwgInN1YiI6ICJkZW1vIiwgInRva2VuVHlwZSI6ICJKV1RUb2tlbiIsICJyZWFsbSI6ICIvIiwgImF1ZCI6IFsgImNsaWVudCIgXSwgImlzcyI6ICJodHRwOi8vb3BlbmFtLmV4YW1wbGUuY29tOjgwODAvb3BlbmFtIiwgImlhdCI6IDEzODcwNDQzMTksICJhdGgiOiAxMzg3MDQ0MzE5IH0.jLdhNexdaE5YS7TAv17wP2daaDcELIw6QTKVjtoWsUQ";

  var token = new JWT.fromB64encodedString(id_token);

  print('token = $token ');
}

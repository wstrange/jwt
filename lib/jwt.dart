library jwt;

import 'dart:convert';
import 'package:crypto/crypto.dart';

/**
 * JSON Web Token
 * See [http://self-issued.info/docs/draft-ietf-oauth-json-web-token.html]
 * This does not currently support any encryption or token verification.
 */
class JWT {
  Map _header;
  Map _claims;
  String  _sig;

  Map get claims => _claims;
  Map get header => _header;

  // Create a JWT from a base64 encoded string. There are 3 parts to the string - seperated with a "." character
  // The first part is the header - which is a map that indicates the crypto used for signing or encrypting the
  // claims. The second is the claims. The third part is the signature.s
  JWT.fromB64encodedString(String p) {
    var t = p.split(".");
    _header = _toJSON(t[0]);
    _claims = _toJSON(t[1]);
    _sig = t[2];
  }

  _toJSON(String part)  {
    var padded = part;
    // Dart b64 library does not like non padded encoding
    switch( (part.length % 4)) {
      case 1: padded = '${part}==='; break;
      case 2: padded = '${part}=='; break;
      case 3: padded = '${part}='; break;
      default: // nothing
    }
    var l = CryptoUtils.base64StringToBytes(padded);

    var s = ASCII.decode(l);
    return JSON.decode(s);
  }

  String toString() => '${_header}${_claims}';

}


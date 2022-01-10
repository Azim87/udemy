import 'package:udemy/data/responses/response.dart';
import 'package:udemy/domain/model/authentication.dart';
import 'package:udemy/domain/model/contact.dart';
import 'package:udemy/domain/model/customer.dart';
import 'package:udemy/util/extensions.dart';

const empty = "";
const zero = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() => Customer(
        this?.id?.orEmpty() ?? empty,
        this?.name?.orEmpty() ?? empty,
        this?.numOfNotifications?.orZero() ?? zero,
      );
}

extension ContactResponseMapper on ContactsResponse? {
  Contact toDomain() => Contact(
        this?.email?.orEmpty() ?? empty,
        this?.phone?.orEmpty() ?? empty,
        this?.link?.orEmpty() ?? empty,
      );
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() => Authentication(
        this?.customer?.toDomain(),
        this?.contacts?.toDomain(),
      );
}

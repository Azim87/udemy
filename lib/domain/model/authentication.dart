import 'package:udemy/domain/model/contact.dart';
import 'package:udemy/domain/model/customer.dart';

class Authentication {
  Customer? customer;
  Contact? contact;

  Authentication(this.customer, this.contact);
}

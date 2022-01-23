import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy/data/repository/respository_impl.dart';
import 'package:udemy/domain/repository/repository.dart';
import 'package:udemy/domain/usecase/login_usecase.dart';
import 'package:udemy/presentation/login/login_viewmodel.dart';
import 'package:udemy/res/assets.dart';
import 'package:udemy/res/dimensions.dart';
import 'package:udemy/res/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginViewModel _loginViewModel;
  late TextEditingController _userNameController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  void _bindViewModel() {
    _loginViewModel.start();
    _userNameController.addListener(
        () => _loginViewModel.setUserName(_userNameController.text));
    _passwordController.addListener(
        () => _loginViewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    //_loginViewModel = LoginViewModel(LoginUseCase(RepositoryImpl(null, null)));
    _bindViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Login'),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: AppPadding.p100),
          child: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Column(
              children: [
                SvgPicture.asset(ImageAssets.icLogin),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _loginViewModel.outputIsUserNameIsValid,
                      builder: (context, snapshot) => TextFormField(
                            keyboardType: TextInputType.name,
                            controller: _userNameController,
                            decoration: InputDecoration(
                              hintText: AppStrings.userName,
                              labelText: AppStrings.userName,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.errorUserName,
                            ),
                          )),
                )
              ],
            ),
          )),
        ),
      );

  @override
  void dispose() {
    _loginViewModel.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

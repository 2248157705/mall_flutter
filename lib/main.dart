import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_app/home_page.dart';
import 'package:login_app/service/api_client.dart';
import 'package:login_app/store/user_provider.dart';
import 'package:login_app/model/login_request.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  bool _showOtherLogin = false;
  late final LoginService _loginService;
  final Dio _dio = buildDioClient("https://testenv.xinguojun.cn/api/gtw/xgj-mall-api/");
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginService = LoginService(_dio);
  }

  void _login() async {
    try {
      LoginRequest request;
      if (_showOtherLogin) {
        request = LoginRequest(
          username: _usernameController.text,
          code: _passwordController.text, // Assuming 'code' field is used for password in this flow
        );
      } else {
        request = LoginRequest(username: '13974371029', code: '2025');
      }

      final response = await _loginService.login(request);
      
      // Save the token
      Provider.of<UserProvider>(context, listen: false).setToken(response.data.token);

      // Navigate to HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on DioError catch (e) {
      // Handle Dio-specific errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.message}')),
      );
    } catch (e) {
      // Handle other errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred: $e')),
      );
    }
  }

  Widget _buildOneClickLoginView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: _login,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            '手机号一键登录',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () {
            setState(() {
              _showOtherLogin = true;
            });
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            side: const BorderSide(color: Colors.grey),
          ),
          child: const Text(
            '其他帐号登录',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildOtherLoginView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: '请输入帐号',
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: '请输入密码',
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            // Implement login with username and password
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            '登录',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login/1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Spacer(flex: 2),
              Text(
                _showOtherLogin ? '其他账号登录' : '您好!',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              if (!_showOtherLogin)
                const Text(
                  '欢迎使用「新果骏」',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              if (!_showOtherLogin)
                const SizedBox(height: 8),
              if (!_showOtherLogin)
                const Text(
                  '注册登录,即可使用',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              const Spacer(flex: 3),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _showOtherLogin ? _buildOtherLoginView() : _buildOneClickLoginView(),
              ),
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  const Flexible(
                    child: Text.rich(
                      TextSpan(
                        text: '我已阅读并同意',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        children: [
                          TextSpan(
                            text: '《用户协议》',
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(text: '和'),
                          TextSpan(
                            text: '《隐私协议》',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
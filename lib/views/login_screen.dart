import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ios_app/main.dart';
import 'package:ios_app/views/card.dart';
import 'package:ios_app/views/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  bool _obscurePassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _handleLogin() async {
    setState(() => _isLoading = true);
    await Future.delayed(1.seconds); // Loading delay
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F192E),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 150),
              
              // Logo/Title with subtle animation
              Column(
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.1),
                  const SizedBox(height: 10),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.1),
                ],
              ),
              const SizedBox(height: 40),
              
              // Email Field with animation
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  // border: InputBorder.none,
    //                enabledBorder: const UnderlineInputBorder(
    //   borderSide: BorderSide(color: Colors.white),
    // ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  prefixIcon: Icon(Icons.email, color: Colors.white.withOpacity(0.7)),
                ),
              ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1),
              const SizedBox(height: 20),
              
              // Password Field with animation and toggle
             TextField(
  controller: _passwordController,
  obscureText: _obscurePassword,
  style: const TextStyle(color: Colors.white),
  decoration: InputDecoration(
    labelText: 'Password',
    labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
    prefixIcon: Icon(Icons.lock, color: Colors.white.withOpacity(0.7)),
    suffixIcon: IconButton(
      icon: Icon(
        _obscurePassword ? Icons.visibility : Icons.visibility_off,
        color: Colors.white.withOpacity(0.7),
      ),
      onPressed: () {
        setState(() => _obscurePassword = !_obscurePassword);
      },
    ),
    // enabledBorder: const UnderlineInputBorder(
    //   borderSide: BorderSide(color: Colors.white),
    // ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  ),
).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1),

              const SizedBox(height: 10),
              
              // Forgot password text
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              GlassContainer(borderRadius: 20,
                child: SizedBox(
                  width: double.infinity,
                  child: AnimatedContainer(
                    duration: 300.ms,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // gradient: LinearGradient(
                      //   colors: [
                      //     const Color(0xFF1E88E5),
                      //     const Color(0xFF0D47A1),
                      //   ],
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      // ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: const Color(0xFF1E88E5).withOpacity(0.4),
                      //     blurRadius: 8,
                      //     offset: const Offset(0, 4),
                      //   ),
                      // ],
                    ),
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                    ),
                  ),
                ).animate().fadeIn(duration: 700.ms).slideY(begin: 0.1),
              ),
              
              // Enhanced Login Button with gradient and animation
              const SizedBox(height: 30),
              const SizedBox(height: 30),
              
              // Divider Section with animation
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'OR CONTINUE WITH',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ],
              ).animate().fadeIn(duration: 800.ms),
              const SizedBox(height: 20),
              
              // Enhanced Social Login Buttons with animation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Google Button
                  _buildSocialButton(
                    icon: 'assets/images/google_logo.png',
                    label: 'Google',
                  ).animate().fadeIn(duration: 900.ms).slideX(begin: -0.5),
                  const SizedBox(width: 20),
                  
                  // Apple Button
                  _buildSocialButton(
                    icon: 'assets/images/apple_logo.png',
                    label: 'Apple',
                  ).animate().fadeIn(duration: 900.ms).slideX(begin: 0.5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({required String icon, required String label}) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {},
      child: GlassContainer(
        borderRadius: 15,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
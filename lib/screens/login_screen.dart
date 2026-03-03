import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      // Simulate network call
      await Future.delayed(const Duration(seconds: 2));
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signed in successfully!',
                style: GoogleFonts.poppins()),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ── Gradient wave header ──────────────────────────────
          _buildWaveHeader(),

          // ── Scrollable form body ──────────────────────────────
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header text
                  _buildHeaderText(),

                  // White card form
                  _buildFormCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────── Wave Header ────────────────────────

  Widget _buildWaveHeader() {
    return ClipPath(
      clipper: _WaveClipper(),
      child: Container(
        height: 320,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF005BEA), Color(0xFF00C6FB)],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 600),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 60, 32, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: GoogleFonts.poppins(
                  fontSize: 38,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                'Sign in!',
                style: GoogleFonts.poppins(
                  fontSize: 38,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 180),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────── Form Card ──────────────────────────

  Widget _buildFormCard() {
    return FadeInUp(
      duration: const Duration(milliseconds: 700),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00C6FB).withOpacity(0.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Email field
              _buildEmailField(),
              const SizedBox(height: 20),

              // Password field
              _buildPasswordField(),
              const SizedBox(height: 8),

              // Forgot password
              _buildForgotPassword(),
              const SizedBox(height: 28),

              // Sign In button
              _buildSignInButton(),
              const SizedBox(height: 28),

              // Sign Up link
              _buildSignUpRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.poppins(fontSize: 14),
      decoration: _inputDecoration(
        hint: 'Enter Your Email',
        icon: Icons.person_outline_rounded,
      ),
      validator: (v) {
        if (v == null || v.isEmpty) return 'Please enter your email';
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      style: GoogleFonts.poppins(fontSize: 14),
      decoration: _inputDecoration(
        hint: 'Password',
        icon: Icons.lock_outline_rounded,
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: Colors.grey,
            size: 20,
          ),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
      ),
      validator: (v) {
        if (v == null || v.isEmpty) return 'Please enter your password';
        if (v.length < 6) return 'Password must be at least 6 characters';
        return null;
      },
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(color: Colors.grey.shade400, fontSize: 14),
      prefixIcon: Icon(icon, color: Colors.grey.shade400, size: 20),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF00C6FB), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          'Forgot Password?',
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return GestureDetector(
      onTap: _isLoading ? null : _handleSignIn,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
            colors: [Color(0xFF005BEA), Color(0xFF00C6FB)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00C6FB).withOpacity(0.4),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: _isLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  'Sign In',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildSignUpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?  ",
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.grey.shade600,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (_, __, ___) => const SignUpScreen(),
                transitionsBuilder: (_, animation, __, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                        parent: animation, curve: Curves.easeOut)),
                    child: child,
                  );
                },
              ),
            );
          },
          child: Text(
            'Sign Up',
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: const Color(0xFF005BEA),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────── Wave Clipper ───────────────────────

class _WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height - 40,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 80,
      size.width,
      size.height - 30,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

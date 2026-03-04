import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _companyController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _companyController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Signed in successfully!',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    }
  }

  // ─────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top gradient wave
          _buildWaveHeader(),
          // Bottom gradient wave
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomWave(),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeaderText(),
                  _buildFormCard(),
                  const SizedBox(height: 140),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Top Wave ────────────────────────────────────────────

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

  // ─── Header Text ─────────────────────────────────────────

  Widget _buildHeaderText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 600),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 50, 32, 0),
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
              const SizedBox(height: 6),
              Text(
                'Welcome back, please login to continue',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.85),
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }

  // ─── White Floating Card ──────────────────────────────────

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
              _buildCompanyField(),
              const SizedBox(height: 20),
              _buildEmailField(),
              const SizedBox(height: 20),
              _buildPasswordField(),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _buildSignInButton(),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 2,
                    child: _buildForgotPassword(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Fields ──────────────────────────────────────────────

  Widget _buildCompanyField() {
    return TextFormField(
      controller: _companyController,
      style: GoogleFonts.poppins(fontSize: 14),
      decoration: _inputDecoration(
        hint: 'Company Name',
        icon: Icons.business_outlined,
      ),
      validator: (v) {
        if (v == null || v.isEmpty) return 'Please enter company name';
        return null;
      },
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
            _obscurePassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Colors.grey,
            size: 20,
          ),
          onPressed: () =>
              setState(() => _obscurePassword = !_obscurePassword),
        ),
      ),
      validator: (v) {
        if (v == null || v.isEmpty) return 'Please enter your password';
        if (v.length < 6) return 'Minimum 6 characters';
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
      hintStyle:
          GoogleFonts.poppins(color: Colors.grey.shade400, fontSize: 14),
      prefixIcon: Icon(icon, color: Colors.grey.shade400, size: 20),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF005BEA), width: 1.5),
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

  // ─── Forgot Password Button ───────────────────────────────

  Widget _buildForgotPassword() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (_, __, ___) => const ForgotPasswordScreen(),
            transitionsBuilder: (_, animation, __, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeOut)),
                child: child,
              );
            },
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Forgot\nPassword?',
          textAlign: TextAlign.right,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
        ),
      ),
    );
  }

  // ─── Sign In Button ───────────────────────────────────────

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
                  ),
                ),
        ),
      ),
    );
  }

  // ─── Bottom Wave ─────────────────────────────────────────

  Widget _buildBottomWave() {
    return ClipPath(
      clipper: _BottomWaveClipper(),
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [Color(0xFF005BEA), Color(0xFF00C6FB)],
          ),
        ),
      ),
    );
  }
}

// ─── Top Wave Clipper ──────────────────────────────────────

class _WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height - 40,
      size.width,
      size.height - 120,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// ─── Bottom Wave Clipper ───────────────────────────────────

class _BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 100);
    path.quadraticBezierTo(
      size.width * 0.5,
      60,
      size.width,
      10,
    );
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

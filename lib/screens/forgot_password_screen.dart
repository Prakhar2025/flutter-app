import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleReset() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _isLoading = false;
        _emailSent = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildWaveHeader(),
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
                  _emailSent ? _buildSuccessCard() : _buildFormCard(),
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

  Widget _buildHeaderText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 600),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 50, 32, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Forgot',
              style: GoogleFonts.poppins(
                fontSize: 38,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              'Password?',
              style: GoogleFonts.poppins(
                fontSize: 38,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Don't worry! Enter your email and\nwe'll send you a reset link.",
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
    );
  }

  // ─── Form Card ────────────────────────────────────────────

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
              Text(
                'Reset Password',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF005BEA),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.poppins(fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  hintStyle: GoogleFonts.poppins(
                      color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon: Icon(Icons.email_outlined,
                      color: Colors.grey.shade400, size: 20),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                        color: Color(0xFF005BEA), width: 1.5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.redAccent),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide:
                        const BorderSide(color: Colors.redAccent, width: 1.5),
                  ),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Please enter your email';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 28),
              GestureDetector(
                onTap: _isLoading ? null : _handleReset,
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
                            'Send Reset Link',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Center(
                  child: Text(
                    'Back to Sign In',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Success Card (after email sent) ─────────────────────

  Widget _buildSuccessCard() {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
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
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF005BEA), Color(0xFF00C6FB)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.mark_email_read_outlined,
                  color: Colors.white, size: 36),
            ),
            const SizedBox(height: 20),
            Text(
              'Check your inbox!',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF005BEA),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'We sent a password reset link to\n${_emailController.text}',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 28),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
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
                  child: Text(
                    'Back to Sign In',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Waves ────────────────────────────────────────────────

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

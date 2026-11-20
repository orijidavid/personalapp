import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class OtpScreen extends StatefulWidget {
  final String? phoneNumber;
  final String? methodDelivery;
  final String? countryCode;

  const OtpScreen({
    super.key,
    this.phoneNumber,
    this.methodDelivery,
    this.countryCode,
  });

  static String routeName = 'otpscreen';
  static String routePath = '/otpscreen';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>
    with TickerProviderStateMixin {

  // Controllers
  final TextEditingController _pinController =
  TextEditingController();

  final FocusNode _pinFocusNode = FocusNode();

  // Processing states
  bool _isProcessing = false;
  bool _pinError = false;
  bool _pinComplete = false;
  bool _otpVerify = false;

  // Countdown timer
  static const int _totalSeconds = 4 * 60;

  int _remainingSeconds = _totalSeconds;

  Timer? _countdownTimer;
  Timer? _resendCooldownTimer;

  bool _timerExpired = false;
  bool _resendCooldown = false;
  int _resendCooldownSeconds = 0;

  // Entrance animations
  late AnimationController _entranceController;
  late Animation<double> _fadeAnimation;

  late Animation<double> _titleFade;
  late Animation<Offset> _titleSlide;

  late Animation<double> _subtitleFade;

  late Animation<double> _pinFade;
  late Animation<Offset> _pinSlide;

  late Animation<double> _timerFade;

  late Animation<double> _btnFade;
  late Animation<Offset> _btnSlide;

  late Animation<double> _resendFade;

  // Shake animation
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  // Timer ring animation
  late AnimationController _ringController;

  @override
  void initState() {
    super.initState();

    _setupAnimations();

    _startEntrance();

    _startCountdown();

    _pinFocusNode.addListener(_onPinFocusChanged);
  }

  // --------------------------------------------------
  // ANIMATIONS
  // --------------------------------------------------

  void _setupAnimations() {

    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(
          0.0,
          0.4,
          curve: Curves.easeIn,
        ),
      ),
    );

    _titleFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(
          0.15,
          0.5,
          curve: Curves.easeOut,
        ),
      ),
    );

    _titleSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(
          0.15,
          0.55,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    _subtitleFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(
          0.25,
          0.6,
          curve: Curves.easeOut,
        ),
      ),
    );

    _pinFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(
          0.35,
          0.7,
          curve: Curves.easeOut,
        ),
      ),
    );

    _pinSlide = Tween<Offset>(
      begin: const Offset(0, 0.35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(
          0.35,
          0.72,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    _timerFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(
          0.5,
          0.8,
          curve: Curves.easeOut,
        ),
      ),
    );

    _btnFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(
          0.6,
          0.9,
          curve: Curves.easeOut,
        ),
      ),
    );

    _btnSlide = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(
          0.6,
          0.92,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    _resendFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(
          0.72,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    // Shake animation

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 480),
    );

    _shakeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _shakeController,
        curve: Curves.elasticOut,
      ),
    );

    // Countdown ring

    _ringController = AnimationController(
      vsync: this,
      value: 1.0,
    );
  }

  void _startEntrance() async {
    await Future.delayed(
      const Duration(milliseconds: 80),
    );

    if (!mounted) return;

    _entranceController.forward();
  }

  // --------------------------------------------------
  // PIN FOCUS
  // --------------------------------------------------

  void _onPinFocusChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  // --------------------------------------------------
  // COUNTDOWN TIMER
  // --------------------------------------------------

  void _startCountdown() {
    _countdownTimer?.cancel();

    _countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }

        setState(() {
          if (_remainingSeconds > 0) {
            _remainingSeconds--;

            _ringController.value =
                _remainingSeconds / _totalSeconds;
          } else {
            _timerExpired = true;
            timer.cancel();
          }
        });
      },
    );
  }

  String get _formattedTime {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  Color get _timerColor {
    if (_timerExpired) {
      return Colors.redAccent;
    }

    if (_remainingSeconds <= 60) {
      return Colors.redAccent;
    }

    if (_remainingSeconds <= 100) {
      return Colors.orange;
    }

    return const Color(0xFF4285F4);
  }

  // --------------------------------------------------
  // RESEND OTP
  // --------------------------------------------------

  void _handleResend() {
    if (_resendCooldown) return;

    setState(() {
      _remainingSeconds = _totalSeconds;

      _timerExpired = false;

      _resendCooldown = true;

      _resendCooldownSeconds = 30;

      _pinError = false;

      _pinComplete = false;
    });

    _pinController.clear();

    _ringController.value = 1.0;

    _startCountdown();

    _resendCooldownTimer?.cancel();

    _resendCooldownTimer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }

        setState(() {
          _resendCooldownSeconds--;

          if (_resendCooldownSeconds <= 0) {
            _resendCooldown = false;
            timer.cancel();
          }
        });
      },
    );
  }

  // --------------------------------------------------
  // PIN ERROR SHAKE
  // --------------------------------------------------

  void _triggerShake() {
    setState(() {
      _pinError = true;
    });

    _shakeController.forward(from: 0).then((_) {
      if (mounted) {
        setState(() {
          _pinError = false;
        });
      }
    });
  }

  // --------------------------------------------------
  // VERIFY OTP
  // --------------------------------------------------

  Future<void> _verifyOtp() async {
    FocusScope.of(context).unfocus();

    final otp = _pinController.text.trim();

    if (otp.length != 6) {
      _triggerShake();
      return;
    }

    setState(() {
      _isProcessing = true;
    });

    /* try {
      final authProvider = Provider.of<AuthProvider>(
        context,
        listen: false,
      );

      final response = await authProvider.verifyOtp(
        identifier: widget.phoneNumber?.trim() ?? '',
        deliveryMethod: widget.methodDelivery ?? '',
        otp: otp,
        context: context,
      );

      if (!mounted) return;

      if (response.success) {
        setState(() {
          _otpVerify = true;
          _pinComplete = true;
        });

        final token = response.data?.accessToken;

        debugPrint('OTP verification successful');

        if (token != null) {
          debugPrint('Access token received');
        }

        Navigator.popUntil(
          context,
              (route) => route.isFirst,
        );
      } else {
        _triggerShake();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP verification failed.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e, stack) {
      debugPrint('OTP verification error: $e');
      debugPrintStack(stackTrace: stack);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Unable to verify OTP. Please try again.',
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }*/
  }

  // --------------------------------------------------
  // DISPOSE
  // --------------------------------------------------

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _resendCooldownTimer?.cancel();

    _entranceController.dispose();
    _shakeController.dispose();
    _ringController.dispose();

    _pinFocusNode.removeListener(_onPinFocusChanged);

    _pinFocusNode.dispose();
    _pinController.dispose();

    super.dispose();
  }

  // --------------------------------------------------
  // MAIN SCREEN
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0052CC),
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [

              // BLUE HEADER

              Container(
                width: double.infinity,
                height: size.height * 0.35,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const SizedBox(height: 40),

                    _buildBackButton(),

                    const Spacer(),

                    const Text(
                      'Verification',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Experience the future of e-commerce, '
                          'designed to make life easier.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const Spacer(),
                  ],
                ),
              ),

              // WHITE CONTENT CARD

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        _buildHeaderText(),

                        const SizedBox(height: 32),

                        _buildPinField(),

                        _buildTimerRow(),

                        _buildContinueButton(),

                        _buildResendRow(),
                      ],
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

  // --------------------------------------------------
  // BACK BUTTON
  // --------------------------------------------------

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // HEADER TEXT
  // --------------------------------------------------

  Widget _buildHeaderText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SlideTransition(
          position: _titleSlide,
          child: FadeTransition(
            opacity: _titleFade,
            child: const Text(
              'Enter Code',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        FadeTransition(
          opacity: _subtitleFade,
          child: Text(
            "Enter the verification code we've shared to "
                "${widget.phoneNumber ?? '+234 90450 0405'}",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6B7280),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  // --------------------------------------------------
  // NATIVE FLUTTER PIN INPUT
  // --------------------------------------------------

  Widget _buildPinField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: FadeTransition(
        opacity: _pinFade,
        child: SlideTransition(
          position: _pinSlide,
          child: AnimatedBuilder(
            animation: _shakeAnimation,
            builder: (context, child) {

              final dx = _shakeController.isAnimating
                  ? math.sin(
                _shakeAnimation.value * math.pi * 6,
              ) * 10
                  : 0.0;

              return Transform.translate(
                offset: Offset(dx, 0),
                child: child,
              );
            },
            child: GestureDetector(
              onTap: () {
                _pinFocusNode.requestFocus();
              },
              child: SizedBox(
                height: 58,
                child: Stack(
                  children: [

                    // SIX PIN BOXES

                    Row(
                      children: List.generate(6, (index) {

                        final pin = _pinController.text;

                        final hasValue = index < pin.length;

                        final isFocused =
                            _pinFocusNode.hasFocus &&
                                index == pin.length &&
                                pin.length < 6;

                        Color borderColor;

                        if (_pinError) {
                          borderColor = Colors.redAccent;
                        } else if (_pinComplete) {
                          borderColor = Colors.green;
                        } else if (isFocused) {
                          borderColor = const Color(0xFF0052CC);
                        } else {
                          borderColor = const Color(0xFFE5E7EB);
                        }

                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: index == 5 ? 0 : 8,
                            ),
                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              height: 52,
                              decoration: BoxDecoration(
                                color: hasValue
                                    ? Colors.white
                                    : const Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: borderColor,
                                  width: isFocused || _pinError
                                      ? 2
                                      : 1.3,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  hasValue ? pin[index] : '',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),

                    // INVISIBLE NATIVE TEXT FIELD
                    // Handles the numeric keyboard and pasted PIN.

                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.01,
                        child: TextField(
                          controller: _pinController,
                          focusNode: _pinFocusNode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                          autofocus: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          showCursor: false,
                          maxLength: 6,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                            contentPadding: EdgeInsets.zero,
                          ),
                          onChanged: (value) {
                            setState(() {
                              _pinComplete = value.length == 6;

                              if (_pinError && value.isNotEmpty) {
                                _pinError = false;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // COUNTDOWN TIMER ROW
  // --------------------------------------------------

  Widget _buildTimerRow() {
    return FadeTransition(
      opacity: _timerFade,
      child: AnimatedBuilder(
        animation: _ringController,
        builder: (context, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                width: 22,
                height: 22,
                child: Stack(
                  fit: StackFit.expand,
                  children: [

                    const CircularProgressIndicator(
                      value: 1.0,
                      strokeWidth: 2.5,
                      color: Color(0xFFE5E7EB),
                    ),

                    CircularProgressIndicator(
                      value: _timerExpired
                          ? 0
                          : _ringController.value,
                      strokeWidth: 2.5,
                      color: _timerColor,
                      strokeCap: StrokeCap.round,
                    ),

                    if (_timerExpired)
                      const Center(
                        child: Icon(
                          Icons.close_rounded,
                          size: 11,
                          color: Colors.redAccent,
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Text(
                _timerExpired
                    ? 'Code expired'
                    : 'Code expires in ',
                style: const TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              if (!_timerExpired)
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    color: _timerColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  child: Text(_formattedTime),
                ),
            ],
          );
        },
      ),
    );
  }

  // --------------------------------------------------
  // CONTINUE / VERIFY BUTTON
  // --------------------------------------------------

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: FadeTransition(
        opacity: _btnFade,
        child: SlideTransition(
          position: _btnSlide,
          child: SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              onPressed: _isProcessing ? null : _verifyOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0052CC),
                foregroundColor: Colors.white,
                disabledBackgroundColor:
                const Color(0xFF0052CC).withValues(alpha: 0.6),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: _isProcessing
                  ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
                  : const Icon(
                Icons.arrow_forward_rounded,
              ),
              label: Text(
                _isProcessing ? 'Verifying...' : 'Verify Code',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // RESEND OTP ROW
  // --------------------------------------------------

  Widget _buildResendRow() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        0,
        18,
        0,
        0,
      ),
      child: FadeTransition(
        opacity: _resendFade,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              _timerExpired
                  ? Icons.warning_amber_rounded
                  : Icons.info_outline,
              color: _timerExpired
                  ? Colors.orange
                  : const Color(0xFF9CA3AF),
              size: 15,
            ),

            const SizedBox(width: 4),

            const Text(
              "Didn't receive it? ",
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            GestureDetector(
              onTap: _resendCooldown ? null : _handleResend,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  color: _resendCooldown
                      ? const Color(0xFFB0BEC5)
                      : const Color(0xFF0052CC),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  decoration: _resendCooldown
                      ? TextDecoration.none
                      : TextDecoration.underline,
                ),
                child: Text(
                  _resendCooldown
                      ? 'Resend in ${_resendCooldownSeconds}s'
                      : 'Resend',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//note: this was made with AI,
//you don't know all this yet
part of 'otp_cubit.dart';

abstract class OtpState {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {
  final OtpResponse response;
  const OtpSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class OtpError extends OtpState {
  final String message;
  const OtpError(this.message);

  @override
  List<Object> get props => [message];
}

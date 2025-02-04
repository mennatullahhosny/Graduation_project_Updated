
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/api/api_manager.dart';
import 'package:graduation_project/data/response/OtpResponse.dart';


part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  Future<void> verifyOtp(String email, String verifyCode) async {
    emit(OtpLoading()); // 🚀 بدأ التحميل

    try {
      final response = await ApiManager.getInstance().verifyCode(email, verifyCode);

      if (response.status == "success") {
  emit(OtpSuccess((response.message ?? "") as OtpResponse)); // ✅ نجاح
} else {
  emit(OtpError(response.message ?? "An unknown error occurred.")); // ❌ خطأ
}
    } catch (e) {
      emit(const OtpError("Failed to connect to the server")); // ❌ مشكلة في الاتصال
    }
  }
}

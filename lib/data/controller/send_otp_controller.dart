import 'package:get/get.dart';
import 'package:live_easy/data/repository/send_otp_repository.dart';

class SendOTPController extends GetxController {
  SendOTPRepository sendOTPRepo;

  SendOTPController({required this.sendOTPRepo});

  String phone = '';
  RxBool isLoading = false.obs;
  String? _verificationId;


  Future<void> sendOTP(Function(String) onCodeSent) async{
    await sendOTPRepo.verifyPhoneNumber(phone, (verificationId) {
      _verificationId = verificationId;
      onCodeSent(phone);
    });
  }

}
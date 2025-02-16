

import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/models/models.dart';

class AuthMapper {
  static Login loginToEntity(LoginResponse login) => Login(
    ok: login.ok,
    token: login.token,
    participant: UserLogin(
      id: login.participant.id, 
      email: login.participant.email, 
      name: login.participant.name, 
      avatar: login.participant.avatar,
      uid: login.participant.uid, 
      uidType: login.participant.uidType, 
      state: login.participant.state
      ),
      message: login.message
  );

  static Logout logoutToEntity(LogoutResponse logout) => Logout(
    ok: logout.ok, message: logout.message);

  static Register registerToEntity(CreateUserResponse register) => Register(
    ok: register.ok,
    token: register.token,
    participant: ParticipantRegister(
      id: register.participantData.id, 
      email: register.participantData.email, 
      name: register.participantData.name, 
      avatar: register.participantData.avatar,
      uid: register.participantData.uid, 
      uidType: register.participantData.uidType, 
      state: register.participantData.state
      ),
    message: register.message
  );

  static SendVerifyPhone sendVerifyPhoneToEntity(SendVerifyPhoneResponse sendVerifyPhone) => 
  SendVerifyPhone(ok: sendVerifyPhone.ok, message: sendVerifyPhone.message);

  static VerifyPhone verifyPhoneToEntity(VerifyPhoneResponse verifyPhone) => 
  VerifyPhone(ok: verifyPhone.ok, message: verifyPhone.message);
}
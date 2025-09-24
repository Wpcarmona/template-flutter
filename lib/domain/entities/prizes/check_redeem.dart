class CheckRedeem {
  final String ok;
  final bool isavailable;
  final bool isredeemable;
  final bool isparticipantcanredeem;
  final String errorParticipantCheck;
  // final Map<String, dynamic>? extraform;

  CheckRedeem(
      {required this.ok,
      required this.isavailable,
      required this.isredeemable,
      required this.isparticipantcanredeem,
      required this.errorParticipantCheck
      // this.extraform
      });
}

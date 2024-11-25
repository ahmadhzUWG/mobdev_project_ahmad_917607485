import 'package:project1_mobdev_ahmad_917607485/Other%20Help/help_request.dart';

import 'other_help_repository.dart';

class OtherHelpController 
{
  OtherHelpController();
  final _otherHelpRepo = OtherHelpRepository();

  Future<HelpRequest> logHelpRequest(HelpRequest helpRequest) async {
    return await _otherHelpRepo.logHelpRequest(helpRequest);
  }
}
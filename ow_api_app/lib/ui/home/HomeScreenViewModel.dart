import 'package:ow_api_app/network/NetworkignResponse.dart';
import 'package:ow_api_app/network/NetworkRepo.dart';
import 'HomeScreenRepository.dart';

import 'package:flutter/cupertino.dart';
import 'package:ow_api_app/data/UserProfile.dart';

class HomeScreenViewModel extends ChangeNotifier {
  HomeScreenViewModel() {
    /// As soon as VM initializes
    /// We want to get the latest data
    getDataFromAPI();
  }

  UserProfile currentUser;
  String messageToShow = "";
  bool isLoading = false;

  void getDataFromAPI() async {
    /// Start showing the loader
    isLoading = true;
    notifyListeners();

    /// Wait for response
    NetworkingResponse networkingResponse =
        await HomeScreenRepository().getLatestStatsData();

    /// We check the type of response and update the required field
    if (networkingResponse is NetworkingResponseData) {
      /// Updating the APIResponseModel when success
      currentUser = networkingResponse.currentUser;
    } else if (networkingResponse is NetworkingException) {
      /// Updating the errorMessage when fails
      messageToShow = networkingResponse.message;
    }

    /// Stop the loader
    isLoading = false;
    notifyListeners();
  }
}

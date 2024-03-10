import 'dart:core';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../app/app_class.dart';

import '../../main.dart';

class StorageManager {
  static const appVersion = 'app_version';
  static const prefIsLoggedIn = 'Pref_LoggedIn';
  static const prefIsFromSignup = 'Pref_isFromSignup';
  static const prefUserType = 'Pref_UserType';
  static const prefjobUserType = 'pref_jobUserType';
  static const prefISAllowLocationDone = 'pref_ISAllowLocationDone';
  static const prefISDeniedLocationDone = 'pref_ISDeniedLocation';
  static const prefRole = 'Pref_Role';
  static const prefLoginResponse = 'Pref_LoginResponse';
  static const prefFCMToken = 'Pref_FCM_Token';
  static const prefAuthToken = 'Pref_Auth_Token';
  static const prefCountryDetail = 'Pref_Country_Detail';
  static const prefConfigureMetaData = 'Pref_Configure_Meta_Data';
  static const prefUser = 'Pref_User';
  static const prefPhoneNumber = 'Pref_Phone_Number';
  static const prefUserEntityId = 'Pref_User_Entity_id';
  static const prefBioMobile = 'Pref_Bio_mobile_sec';
  static const prefBioEmail = 'Pref_Bio_Email_sec';
  static const prefBusinessId = 'Pref_Business_Id';
  static const prefJobId = 'Pref_Job_Id';
  static const prefGuestJobId = 'Pref_GuestJob_Id';
  static const prefGuestJobType = 'Pref_Job_Type';
  static const prefIsFromGuestMode = 'Pref_IsFrom_GuestMode';
  static const prefIsApplyBasicInfoDone = 'Pref_IsApply_BasicInfo_Done';
  static const prefEnterZipcode = 'Pref_EnterZipcode';
  static const prefApplyCount = 'Pref_Apply_Count';
  static const prefExpAddedInd = 'Pref_ExpAddedInd';
  static const prefagencyid = 'Pref_agency_id';
  static const prefIsBioMetricOn = 'Pref_Is_BioMetric_On';
  static const prefBioMetricDate = 'Pref_BioMetric_Date';
  static const prefReferenceForOtp = 'Pref_reference_otp';
  static const prefUserName = 'Pref_User_Name';
  static const prefReferralCode = 'Pref_RefferalCode';
  static const prefBackupData = 'prefBackUpData';
  static const prefUserApplyStatus = 'prefUserApplyStatus';
  static const prefEmail = 'Pref_User_Email';
  static const prefUserSignUpStepSeen = 'Pref_User_SignUp_Step_Seen';
  static const prefTokenExpireTime = 'Pref_Token_Expire_Time';
  static const prefDeeplinkValue = 'prefDeeplinkValue';
  static const prefDeeplinkValueForJS = 'prefDeeplinkValueForJS';
  static const jpStatus = 'jpStatus';
  static const currentStatus = 'currentStatus';
  static const businessTypeId = 'businessTypeId';
  static const fullName = 'fullName';
  static const firstName = 'firstName';
  static const lastName = 'lastName';
  static const currentRole = 'currentRole';
  static const clientLat = 'clientLat';
  static const clientLon = 'clientLon';
  static const city = 'city';
  static const state = 'state';
  static const pinCode = 'pinCode';
  static const payType = 'payType';
  static const prefTrackMenuCounter = 'track_menu_counter';
  static const prefProfileMenuCounter = 'profile_menu_counter';
  static const prefJPJobPostIntroGIFCount = 'jp_job_post_intro_gif_count';
  static const prefJSLandingIntroGIFCount = 'js_landing_intro_gif_count';
  static const prefJSTrackIntroGIFCount = 'js_track_intro_gif_count';
  static const prefJSProfileIntroGIFCount = 'js_profile_intro_gif_count';
  static const isPendingPublishedJob = 'isPendingPublishedJob';
  static const activeJobInd = 'activeJobInd';

  static void setString(key, value) {
    GetStorage().write(key, value);
  }

  static String getUserName() {
    return GetStorage().read(prefUserName) ?? '';
  }

  static String getString(key) {
    return GetStorage().read(key) ?? '';
  }

  static int getUserEntityID() {
    return GetStorage().read(prefUserEntityId) ?? 0;
  }

  static int getBusinessTypeID() {
    return GetStorage().read(businessTypeId) ?? 0;
  }

  static int getBusinessId() {
    return GetStorage().read(prefBusinessId) ?? 0;
  }

  static String getReferenceOtpString() {
    return GetStorage().read(prefReferenceForOtp) ?? '';
  }

  static void setReferenceOtpString<String>(value) {
    GetStorage().write(prefReferenceForOtp, value);
  }

  static void setUserData<User>(user) {
    GetStorage().write(prefUser, user);
  }

  static void setInt(key, value) {
    GetStorage().write(key, value);
  }

  static int getInt(key) {
    return GetStorage().read(key) ?? 0;
  }

  static Future<void> logout() async {
    var tempAppVersion = getString(appVersion);
    var countryDetail = getString(prefCountryDetail);
    var configData = getString(prefConfigureMetaData);
    var phoneNumber = getString(prefPhoneNumber);
    var isBioMetricOn = getBool(prefIsBioMetricOn);
    var bioMetricDate = getString(prefBioMetricDate);
    var email = getString(prefEmail);
    var bioEmail = getString(prefBioEmail);
    var bioMobile = getString(prefBioMobile);

    String fcmtoken = getString(prefFCMToken);

    // var guestModeJobId = getString(prefGuestJobId);
    var guestModeJobType = getString(prefGuestJobType);
    var isApplyBasicInfoDone = getBool(prefIsApplyBasicInfoDone);
    var applyCount = getInt(prefApplyCount);
    var expAddedInd = getBool(prefExpAddedInd);
    var trackMenuCounter = getInt(prefTrackMenuCounter);
    var profileMenuCounter = getInt(prefProfileMenuCounter);
    var jpJobPostIntroGIFCount = getInt(prefJPJobPostIntroGIFCount);
    var jsLandingIntroGIFCount = getInt(prefJSLandingIntroGIFCount);
    var jsTackIntroGIFCount = getInt(prefJSTrackIntroGIFCount);
    var jsProfileIntroGIFCount = getInt(prefJSProfileIntroGIFCount);

    GetStorage().erase();

    setString(prefFCMToken, fcmtoken);
    setString(appVersion, tempAppVersion);
    setString(prefCountryDetail, countryDetail);
    setString(prefConfigureMetaData, configData);
    setString(prefPhoneNumber, phoneNumber);
    setBool(prefIsBioMetricOn, isBioMetricOn);
    setString(prefBioMetricDate, bioMetricDate);
    setString(prefBioEmail, bioEmail);
    setString(prefBioMobile, bioMobile);
    setString(prefEmail, email);
    setString(prefUserType, prefUserType);
    setInt(prefUserEntityId, 0);
    // setString(prefGuestJobId, guestModeJobId);
    setString(prefGuestJobType, guestModeJobType);
    setBool(prefIsApplyBasicInfoDone, isApplyBasicInfoDone);
    setInt(prefApplyCount, applyCount);
    setBool(prefExpAddedInd, expAddedInd);
    setInt(prefTrackMenuCounter, trackMenuCounter);
    setInt(prefProfileMenuCounter, profileMenuCounter);
    setInt(prefJPJobPostIntroGIFCount, jpJobPostIntroGIFCount);
    setInt(prefJSLandingIntroGIFCount, jsLandingIntroGIFCount);
    setInt(prefJSTrackIntroGIFCount, jsTackIntroGIFCount);
    setInt(prefJSProfileIntroGIFCount, jsProfileIntroGIFCount);

    setString(prefEmail, null);
    setString(fullName, null);
    setString(currentRole, null);

    return Future.value();
  }

  static void setBool(key, value) {
    GetStorage().write(key, value);
  }

  static bool getIsUserSignUpStepSeen(key) {
    return GetStorage().read(key) ?? false;
  }

  static bool getBool(key) {
    return GetStorage().read(key) ?? false;
  }
}

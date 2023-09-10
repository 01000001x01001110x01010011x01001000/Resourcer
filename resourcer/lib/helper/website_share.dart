import 'package:social_share/social_share.dart';

class WebSiteShare {
  shareWebsite(String websiteName, String websiteUrl) async {
    await SocialShare.shareWhatsapp(
        "Hey Checkout this awesome website -> $websiteName  <- \n Website Url -> $websiteUrl <- \n Also Check more awesome websites at -> Resourcer app <- on playstore ");
  }
}

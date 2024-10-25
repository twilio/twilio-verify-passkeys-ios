// swift-tools-version:5.3
import PackageDescription

let package = Package(
   name: "TwilioVerifyPasskeys",
   platforms: [
     .iOS(.v14),
   ],
   products: [
      .library(name: "TwilioVerifyPasskeys", targets: ["TwilioVerifyPasskeys"])
   ],
   targets: [
      .binaryTarget(
         name: "TwilioVerifyPasskeys",
         url: "https://github.com/twilio/twilio-verify-passkeys-ios/releases/download/v0.2.0/TwilioPasskeysAuthentication.xcframework.zip",
         checksum: "eae45efdd6f623de7f1f81e017e04af41d8fff330b8a75dfa4082a17f6778eee")
   ]
)

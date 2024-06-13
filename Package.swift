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
         url: "https://github.com/twilio/twilio-verify-passkeys/releases/download/0.0.1-ios/TwilioVerifyPasskeys.xcframework.zip",
         checksum:"101d01e9b669ef4efc3b209de06ccf4b6428f29600bf98376ed5f563a436e2b8")
   ]
)

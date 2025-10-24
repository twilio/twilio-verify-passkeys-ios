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
         url: "https://github.com/twilio/twilio-verify-passkeys-ios/releases/download/v0.4.0/TwilioPasskeysAuthentication.xcframework.zip",
         checksum: "1f5c00dc3c03faa0ba0f3d690b430db7e707ff826aa0f8f0fa1364259ad34d5c")
   ]
)

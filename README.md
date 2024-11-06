# Twilio Verify Passkeys iOS SDKs (KMP)

This repository contains releases for the Twilio Verify Passkeys for iOS SDK. These releases can be installed using Swift Package Manager.

## Table of Contents

* [About](#about)
* [Documentation](#documentation)
* [Requirements](#requirements)
* [Installation](#installation)
* [Quickstart](#quickstart)
* [License](#license)

## About <a name="about"></a>

Twilio Passkeys SDK enables developers to easily add Passkeys into their existing authentication flows within their own mobile applications. The Verify Passkeys SDK supports passkeys creation and authentication using the FIDO/WebAuthn industry standard.

## Documentation <a name="documentation"></a>

[Verify Passkeys Overview](https://www.twilio.com/docs/verify/passkeys)

## Requirements <a name="requirements"></a>

- [Xcode](https://developer.apple.com/xcode/) for iOS development. 15.x
- iOS 16 or higher

# Installation <a name="installation">

## Swift Package Manager

You can add Twilio Verify Passkeys for iOS by adding the `https://github.com/twilio/twilio-verify-passkeys-ios.git` repository as a Swift Package. 

In your *Build Settings*, you will also need to modify `Other Linker Flags` to include `-ObjC`.

## Quickstart <a name="quickstart"></a>

### Create registration

Use the `TwilioPasskey` instance to create a registration by calling the `create(String, AppContext)` function.

The first param is a `String` representation of a challenge payload, check how to [create your challenge payload](#create-challenge-payload) (`challengePayload`).

The second param is an instance of a `com.twilio.passkeys.AppContext`, it is created by passing the current `UIWindow` instance in iOS.

You can also call the `create(CreatePasskeyRequest, AppContext)` function, where `CreatePasskeyRequest` is a wrapper object of a [creation challenge payload](#create-challenge-payload) schema.

**iOS**

```
let twilioPasskey = TwilioPasskey()
let response = try await twilioPasskey.create(challengePayload: challengePayload, appContext: AppContext(uiWindow: window))
if let success = response as? CreatePasskeyResult.Success {
  // verify the createPasskeyResult.createPasskeyResponse against your backend and finish sign up
} else if let error = response as? CreatePasskeyResult.Error {
  // handle error
}
```

### Authenticate a user

Use the `TwilioPasskey` instance to authenticate a user by calling the `authenticate(String, AppContext)` function.

The first param is a `String` representation of an authentication request, it follows the schema of an [authentication challenge payload](#authenticate-challenge-payload).

The second param is an instance of a `com.twilio.passkeys.AppContext`, it is created by passing the current `Activity` instance in Android or the `UIWindow` instance in iOS.

You can also call the `authenticate(AuthenticatePasskeyRequest, AppContext)` function, which the `AuthenticatePasskeyRequest` is a wrapper object of an [authentication challenge payload](#authenticate-challenge-payload).


**iOS**

```
let twilioPasskey = TwilioPasskey()
let response = try await twilioPasskey.authenticate(challengePayload: json, appContext: AppContext(uiWindow: window))
if let success = response as? AuthenticatePasskeyResult.Success {
  // verify the authenticatePasskeyResult.authenticatePasskeyResponse against your backend and finish sign in.
} else if let error = response as? AuthenticatePasskeyResult.Error {
  // handle error
}
```

### Create Challenge Payload <a name="create-challenge-payload"></a>

The challenge payload for creating a registration is a String obtained by requesting your backend a challenge for registering a user, it uses the JSON schema:
```
{"rp":{"id":"your_backend","name":"PasskeySample"},"user":{"id":"WUV...5Ng","name":"1234567890","displayName":"1234567890"},"challenge":"WUY...jZQ","pubKeyCredParams":[{"type":"public-key","alg":-7}],"timeout":600000,"excludeCredentials":[],"authenticatorSelection":{"authenticatorAttachment":"platform","requireResidentKey":false,"residentKey":"preferred","userVerification":"preferred"},"attestation":"none"}
```

### Authenticate Challenge Payload <a name="authenticate-challenge-payload"></a>

The challenge payload for authenticating a user is a JSON with the schema:
```
{"publicKey":{"challenge":"WUM...2Mw","timeout":300000,"rpId":"your_backend","allowCredentials":[],"userVerification":"preferred"}}
```


## License

Twilio Verify Passkeys for iOS is distributed under [TWILIO-TOS](https://www.twilio.com/legal/tos).
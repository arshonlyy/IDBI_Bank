# IDBI-style Banking UI Demo

This is a student/demo Flutter application. It is not the official IDBI Bank app and does not connect to IDBI Bank, UPI, NPCI, or any payment network.

## Build in Codemagic
The repository can keep this project in the `Banking/` directory. Your existing root `codemagic.yaml` can run:
- `cd Banking && flutter pub get`
- `cd Banking && flutter create --platforms=android .`
- `cd Banking && flutter build apk --release`

## Android app label
Because Android is generated in Codemagic, after `flutter create` the default label comes from the Flutter project name. For a safe demo identity, use `IDBI Bank UI Demo`, not the official app identity.

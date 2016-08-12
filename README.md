## test\_mode

Use this variable to set the Validator in test mode. It is sometimes easier to
test by passing in a request data structure (and makes unit testing possible)
instead of passing in an actual Catalyst Request object.

## echo\_domain

The echo domain that must be present in the Subject Alternative Names (SANs) section of the signing certificate

## application\_id

Application ID from your app's Amazon Alexa App settings

## cert\_dir

Directory in which to store your Alexa certificate, once validated

## validate\_request

Make sure this is a valid Amazon Alexa request. Check things like application\_id, certificates, timestamp.

returns { success, error\_msg }

## \_invalid\_keychain\_uri

Validate keychain uri from Amazon is proper. undef indicates no errors found.
Example URI: https://s3.amazonaws.com/echo.api/echo-api-cert-3.pem

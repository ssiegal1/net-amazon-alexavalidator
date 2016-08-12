# NAME

Net::Amazon::AlexaValidator - implements all security-related checks required for
Amazon Alexa Skills.

# SYNOPSIS

    my $alexa_validator = Net::Amazon::AlexaValidator->new({
      application_id => 'my_application_id_from_amazon_dev_site',
      echo_domain    => 'DNS:echo-api.amazon.com',
      cert_dir       => '/tmp/',
      });
    my $request = $c->req; # Requires a L<Catalyst::Request> object
    my $ret = $alexa_validator->validate_request($request);

# DESCRIPTION

Highlights of the validation include:

- Verifies the Signature Certificate URL. Amazon's requirements are listed here: [https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/developing-an-alexa-skill-as-a-web-service#h2\_verify\_sig\_cert](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/developing-an-alexa-skill-as-a-web-service#h2_verify_sig_cert)
- Downloads the PEM-encoded X.509 certificate chain that Alexa used to sign the message as specified by the SignatureCertChainUrl header value on the request.
- Validates that the signing certificate has not expired (examine both the Not Before and Not After dates).
- Validates that the domain echo-api.amazon.com is present in the Subject Alternative Names (SANs) section of the signing certificate.
- Validates that all certificates in the chain combine to create a chain of trust to a trusted root CA certificate.
- Base64-decodes the Signature header value on the request to obtain the encrypted signature.
- Uses the public key extracted from the signing certificate to decrypt the encrypted signature to produce the asserted hash value. Generates a SHA-1 hash value from the full HTTPS request body to produce the derived hash value, and compares the asserted hash value and derived hash values to ensure that they match.
- Checks the request timestamp to ensure that the request is not an old request being sent as part of a "replay" attack.

# Configuration options

## echo\_domain

The echo domain that must be present in the Subject Alternative Names (SANs) section of the signing certificate

## application\_id

Application ID from your app's Amazon Alexa App settings

## cert\_dir

Directory in which to store your Alexa certificate, once validated

# Subroutines

## validate\_request

Verifies this is a valid Amazon Alexa request. Checks things like application\_id, certificates, timestamp.

returns { success, error\_msg }

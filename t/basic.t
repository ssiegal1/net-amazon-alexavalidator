use strict;
use Test::More;
use Net::Amazon::AlexaValidator;

# replace with the actual test

  my $request_body = {
    session => {
      sessionId => "SessionId.990eb6d0-939a-4698-a965-546f9747fd64"
      application => {
        applicationId => "amzn1.echo-sdk-ams.app.app-id"
      },
      attributes => {},
      user => {
        userId => "amzn1.ask.account.XXXXXXXXXXX"
      },
    },
    request => {
      type => "IntentRequest",
      requestId => "EdwRequestId.26cad6f6-5abf-4a13-93ae-130c2ab250f7",
      locale => "en-US",
      timestamp => DateTime->now()->iso8601().'Z',
      intent => {
      }
    },
    version => "1.0"
  };
  my $alexa_validator = Net::Amazon::AlexaValidator->new(
    application_id => $self->app_id,
    cert_dir => $self->cert_dir
    );

  my $ret = $alexa_validator->validate_request($c->req);
  ok $ret->{success}, 'Validated Amazon request';

done_testing;

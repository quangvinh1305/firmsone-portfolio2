CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'faxeboc'
  config.aws_acl    = 'public-read'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }

  config.aws_credentials = {
    access_key_id:     'AKIAIT75LEB25LLCZ7FQ',
    secret_access_key: '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',
    region:            'us-east-1' # Required
  }
end


CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'firmsone'
  config.aws_acl    = 'public-read'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }

  config.aws_credentials = {
    access_key_id:     'AKIAIDZXBMK2V4GFLK3A',
    secret_access_key: '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',
    region:            'us-west-2' # Required
  }
end
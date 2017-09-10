AssetSync.configure do |config|
  config.fog_provider = 'AWS'
  config.fog_directory = ENV['S3_BUCKET']
  config.aws_access_key_id = ENV['S3_ID']
  config.aws_secret_access_key = ENV['S3_KEY']

  # Don't delete files from the store
  # config.existing_remote_files = 'keep'
  #
  # Increase upload performance by configuring your region
  config.fog_region = ENV['S3_REGION']
  #
  # Automatically replace files with their equivalent gzip compressed version
  # config.gzip_compression = true
  #
  # Use the Rails generated 'manifest.yml' file to produce the list of files to
  # upload instead of searching the assets directory.
  # config.manifest = true
  #
  # Fail silently.  Useful for environments such as Heroku
  # config.fail_silently = true
  #
  # Log silently. Default is `true`. But you can set it to false if more logging message are preferred.
  # Logging messages are sent to `STDOUT` when `log_silently` is falsy
  # config.log_silently = true

  config.run_on_precompile = true
end

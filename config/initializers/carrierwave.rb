S3 = YAML::load(File.open("#{Rails.root}/config/s3.yml"))[Rails.env.to_s]

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => S3['access_key_id'],       # required
    :aws_secret_access_key  => S3['secret_access_key'],       # required
    :region                 => 'us-west-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = S3['bucket']                     # required
  #config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  #config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
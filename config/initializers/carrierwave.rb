CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                        # required unless using use_iam_profile
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                        # required unless using use_iam_profile
    use_iam_profile:       false,                         # optional, defaults to false
    region:                ENV['AWS_REGION'],                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['AWS_BUCKET']                                     # required
  config.fog_public     = false                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}

end
if Rails.env.test? || Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/spec/support/uploads/tmp"
      end

      def store_dir
        "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end
end
# CarrierWave.configure do |config|
#   config.storage    = :aws
#   config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
#   config.aws_acl    = 'public-read'

#   # Optionally define an asset host for configurations that are fronted by a
#   # content host, such as CloudFront.
#   config.asset_host = 'http://example.com'
#   config.asset_public_host = true

#   # The maximum period for authenticated_urls is only 7 days.
#   config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

#   # Set custom options such as cache control to leverage browser caching
#   config.aws_attributes = {
#     expires: 1.week.from_now.httpdate,
#     cache_control: 'max-age=604800'
#   }

#   config.aws_credentials = {
#     access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
#     secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
#     region:            ENV.fetch('AWS_REGION'), # Required
#     stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
#   }

#   # Optional: Signing of download urls, e.g. for serving private content through
#   # CloudFront. Be sure you have the `cloudfront-signer` gem installed and
#   # configured:
#   # config.aws_signer = -> (unsigned_url, options) do
#   #   Aws::CF::Signer.sign_url(unsigned_url, options)
#   # end
# end
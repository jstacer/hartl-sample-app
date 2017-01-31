if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAIXZCHH5MO4MAWCZQ'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['hartlsampleapp9890'] # Name of bucket I created on AWS
  end
end
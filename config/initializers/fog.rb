 if Rails.env.test? || Rails.env.development?

 CarrierWave.configure do |config|
   config.storage = :file
 end

end

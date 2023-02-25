CarrierWave.configure do |config|
  config.storage = :file
  config.enable_processing = false
end

RSpec.configure do |config|
  config.after(:suite) do
    FileUtils.rm_rf(Rails.root.join('spec', 'uploads'))
  end
end

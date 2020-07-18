require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module DiveIntoWork
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    config.load_defaults 5.1
    config.generators do |g|
      # 以下二行で自動生成しない設定
      g.assets false
      g.helper false
      config.time_zone = 'Tokyo'
      config.active_record.default_timezone = :local
    end
  end
end
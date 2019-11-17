module ActiveadminSettings
  class Engine < Rails::Engine
    isolate_namespace ActiveadminSettings
    initializer "helper" do |app|
      ActiveSupport.on_load(:action_controller) do
        include ActiveadminSettings::Helpers
      end
    end
  end

  class Railtie < ::Rails::Railtie
    config.after_initialize do
      require 'active_support/i18n'
      I18n.load_path += Dir[File.expand_path('../locales/*.yml', __FILE__)]
    end
  end
end

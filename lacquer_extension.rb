# Uncomment this if you reference any of your controllers in activate
# require_dependency "application_controller"
require "radiant-lacquer-extension"

class LacquerExtension < Radiant::Extension
  version     RadiantLacquerExtension::VERSION
  description RadiantLacquerExtension::DESCRIPTION
  url         RadiantLacquerExtension::URL

  # See your config/routes.rb file in this extension to define custom routes

  extension_config do |config|
    # config is the Radiant.configuration object
  end

  def activate
    Admin::ResourceController.send :include, Lacquer::ResourceControllerExtension
  end
end

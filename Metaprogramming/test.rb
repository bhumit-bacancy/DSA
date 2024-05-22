module TestApp
  class Application
    def self.configure(&block)
      @config ||= {}
      class_eval(&block)
    end

    def self.config
      @config
    end

    def self.conf
      @config
    end
  end
end

# TestApp::Application.configure do
#   config[:cache_classes] = true

#   config[:consider_all_requests_local]       = false
#   config[:action_controller]                 = true
  
# end

# puts TestApp::Application.config.inspect



TestApp::Application.configure do
  config[:cache_classes]     = true
  config[:action_controller] = true
end
 
puts TestApp::Application.conf[:cache_classes]
 
TestApp::Application.configure do
  config[:cache_classes]     = false
end
 
puts TestApp::Application.conf[:cache_classes]
puts TestApp::Application.conf[:action_controller]
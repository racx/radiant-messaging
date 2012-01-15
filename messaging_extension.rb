# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class MessagingExtension < Radiant::Extension
  version "1.0"
  description "Messaging System, like ShoutBox"
  url "http://funtocode.com"
  
  # extension_config do |config|
  #   config.gem 'some-awesome-gem
  #   config.after_initialize do
  #     run_something
  #   end
  # end

  # See your config/routes.rb file in this extension to define custom routes
  
  def activate
    # tab 'Content' do
    #   add_item "Messaging", "/admin/messaging", :after => "Pages"
    # end
    Page.send :include, MessagingTags
    Member.send :include, MessageMember
  end
end

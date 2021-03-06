# require 'ruby-debug'

alias q exit
alias hush ActiveRecord::Base.logger.level = 2

# user_id = lambda do
#     case `whoami`
#     when 'jay' then 475
#     when 'gclements' then 381
#     when 'imclean' then 412
#     when 'tharrison' then 33
#     end
#   end

# Easily print methods local to an object's class
class Object
  def local_methods
    ((methods - Object.instance_methods) - (Comparable.instance_methods + Enumerable.instance_methods + Array.instance_methods)).sort
  end
end

if defined?(Rails)
  include Rails.application.routes.url_helpers
  default_url_options[:host] = 'localhost'

  # We have no current_user, and we depend on it for many methods, so we fake it out here.
  # Most of the time, we're calling a Devise helper that expects it on the current_controller.
  # That'll be nil, so we add the method to nil...

  class NilClass
    def current_user
      User.find(475)
    end
  end
end
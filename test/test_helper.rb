ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  def login_as_admin
    @request.env["devise.mapping"] = Devise.mappings[:user]
    if (@logined != nil)
      sign_out :user
    end
    sign_in users(:admin)
    @logined = true
  end

  def login_as_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    if (@logined != nil)
      sign_out :user
    end
    sign_in users(:user)
    @logined = true
  end

  def login_as_pahan
    @request.env["devise.mapping"] = Devise.mappings[:user]
    if (@logined != nil)
      sign_out :user
    end
    sign_in users(:pahanUser)
    @logined = true
  end

  def login_as_reporter
    @request.env["devise.mapping"] = Devise.mappings[:user]
    if (@logined != nil)
      sign_out :user
    end
    sign_in users(:reportUser)
    @logined = true
  end
  # Add more helper methods to be used by all tests here...
end

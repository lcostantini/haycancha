ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start

end

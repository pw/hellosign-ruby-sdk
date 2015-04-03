# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

require 'webmock/rspec'
require 'pry'
require File.expand_path('../../lib/hello_sign', __FILE__)

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end

def load_fixture(name)
  File.new(File.dirname(__FILE__) + "/fixtures/#{name}.json")
end

def load_file(name)
  File.read(File.new(File.dirname(__FILE__) + "/fixtures/#{name}"))
end

def stub_get(path, fixture, status_code=200)
  stub_request(:get, "#{HelloSign.end_point}#{HelloSign.api_version}#{path}").
    to_return(:body => load_fixture(fixture), :status => status_code)
end

def a_get(path)
  a_request(:get, "#{HelloSign.end_point}#{HelloSign.api_version}#{path}")
end

def stub_post(path, fixture, status_code=200)
  stub_request(:post, "#{HelloSign.end_point}#{HelloSign.api_version}#{path}").
    to_return(:body => load_fixture(fixture), :status => status_code)
end

def stub_post_oauth(path, fixture, status_code=200)
  stub_request(:post, "#{HelloSign.oauth_end_point}#{path}").
    to_return(:body => load_fixture(fixture), :status => status_code)
end

def a_post(path)
  a_request(:post, "#{HelloSign.end_point}#{HelloSign.api_version}#{path}")
end

def a_post_oauth(path)
  a_request(:post, "#{HelloSign.oauth_end_point}#{path}")
end

def stub_put(path, fixture)
  stub_request(:put, "#{HelloSign.end_point}#{HelloSign.api_version}#{path}").
    to_return(:body => load_fixture(fixture))
end

def a_put(path)
  a_request(:put, "#{HelloSign.end_point}#{HelloSign.api_version}#{path}")
end

def stub_delete(path, fixture)
  stub_request(:delete, "#{HelloSign.end_point}#{HelloSign.api_version}#{path}").
    to_return(:body => load_fixture(fixture))
end

def a_delete(path)
  a_request(:delete, "#{HelloSign.end_point}#{HelloSign.api_version}#{path}")
end

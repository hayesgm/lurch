require "lurch/version"
require 'net/http'

module Lurch
  
  # Your code goes here...
  def self.track(exception, context={})
    uri = URI('http://dev.golurch.com:9119/track-exception')
    
    params = { name: exception.class.name, message: exception.message, context: context.to_json }
    params.merge!(backtrace: exception.backtrace.join("\n")) if exception.backtrace
    
    res = Net::HTTP.post_form(uri, params)
  end
end

$:.unshift File.dirname(__FILE__)

require 'httparty'

require 'eisenhower/version'
require 'eisenhower/client'
require 'eisenhower/roadmap'
require 'eisenhower/road'
require 'eisenhower/road_update'
require 'eisenhower/staff'

module Eisenhower
  class APIError < RuntimeError; end
  class << self
    attr_accessor :oauth_token
    
    def version
      VERSION
    end
    
    def history
      "The Dwight D. Eisenhower National System of Interstate and Defense Highways, commonly called the Interstate Highway System or Interstate Freeway System, and colloquially abbreviated 'the Interstate', is a network of limited-access roadways (also called freeways or expressways) in the United States. It is named for President Dwight D. Eisenhower, who championed its formation."
    end
    
  end

end
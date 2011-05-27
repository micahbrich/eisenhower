module Eisenhower
  class Staff
    attr_accessor :id, :full_name, :email, :admin
    alias :name :full_name
        
    def initialize(attributes={})
      attributes.each { |key, val| send("#{key}=", val) if respond_to?("#{key}=") }
    end
    
    def admin?
      @admin
    end
    
    class << self
      def find(staff_id)
        body = Eisenhower::Client.get_and_parse("/staff/get/id/#{staff_id}")
        Eisenhower::Staff.new({
          :id               => body["_id"],
          :full_name        => body["fullName"],
          :email            => body["email"],
          :admin            => body["admin"]
        })
      end
    end
  end
end
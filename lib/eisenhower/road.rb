module Eisenhower
  class Road
    attr_accessor :id, :title, :description, :description_html, :collapsed, :started, :status, :due, :position, :updates_count, :update_ids, :staff_ids
    alias :name :title
    BOOLEANS = %w(collapsed due)
    
    def initialize(attributes={})
      attributes.each { |key, val| send("#{key}=", val) if respond_to?("#{key}=") }
    end

    BOOLEANS.each do |boolean|
      define_method("#{boolean}?") do
        self.instance_variable_get("@#{boolean}")
      end
    end
    
    def updates
      self.update_ids.collect{|id| Eisenhower::RoadUpdate.find(id)}
    end
    
    def staff
      self.staff_ids.collect{|id| Eisenhower::Staff.find(id)}
    end
    
    
    class << self
      def find(road_id)
        body = Eisenhower::Client.get_and_parse("/road/get/id/#{road_id}")
        Eisenhower::Road.new({
          :id               => body["_id"], 
          :title            => body["title"], 
          :description      => body["description"], 
          :description_html => body["descriptionHtml"], 
          :collapsed        => body["collapsed"], 
          :status           => body["status"]["status"], 
          :due              => body["due"] ? body["due"]["dmy"] : false,
          :started          => body["start"] ? body["start"]["dmy"] : false,
          :position         => body["order"]["position"], 
          :updates_count    => body["updatesCount"],
          :update_ids       => body["updates"].collect{|up| up["_id"]},
          :staff_ids        => body["staffList"]
        })
      end
    end
  end
end
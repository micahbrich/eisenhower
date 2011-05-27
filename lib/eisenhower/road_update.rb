module Eisenhower
  class RoadUpdate
    attr_accessor :id, :road_id, :staff_id, :time, :update, :road_map_id, :app_id, :staff
    alias :user :staff
    alias :owner :staff
    
    def initialize(attributes={})
      attributes.each { |key, val| send("#{key}=", val) if respond_to?("#{key}=") }
    end
    
    def staff
      Eisenhower::Staff.find(self.staff_id)
    end
    
    class << self
      
      def all(options={})
        roadmap_id=nil, app_id=nil, limit=3, skip=0
        options = {
            :roadmap_id => nil, 
            :app_id => nil,
            :limit => 3,
            :skip => 0
            }.merge(options)
            
        body = Eisenhower::Client.get_and_parse("/update/listAll/roadmap/#{options[:roadmap_id]}/app/#{options[:app_id]}/limit/#{options[:limit]}/skip/#{options[:skip]}")
        body["updates"].collect{|update| 
          Eisenhower::RoadUpdate.new({
            :id               => update["_id"],
            :road_id          => update["roadId"],
            :staff_id         => update["staffId"],
            :time             => update["time"],
            :update           => update["update"]
          })}
      end
      
      def find(road_update_id)
        body = Eisenhower::Client.get_and_parse("/update/get/id/#{road_update_id}")
        Eisenhower::RoadUpdate.new({
          :id               => body["_id"],
          :road_id          => body["roadId"],
          :staff_id         => body["staffId"],
          :time             => body["time"],
          :update           => body["update"]
        })
      end
      
    end
    
    
  end
end
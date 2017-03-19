class Driver < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #   # :confirmable, :lockable, :timeoutable and :omniauthable
      devise :database_authenticatable, :registerable,
               :recoverable, :rememberable, :trackable, :validatable

       has_many :bookings
       belongs_to :taxy

       def distance
              attributes['distance']
       end
	
       def self.find_driver(source)
	    find(:first, :select => 'vehicle', :conditions => ["source = #{source}"]) 
       end

       def self.get_pink_taxi(source, taxi_color)
	    find(:first, :select => 'vehicle', :conditions => ["source = #{source} and color = #{taxi_type}"]) if !taxi_color.nil?
       end
end

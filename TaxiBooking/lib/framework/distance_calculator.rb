module Distance
  RADIUS = 6371
	class DistanceCalculater
  		def calculate_distance(lattitude1, longittude1)
			lat1 = to_rad(lattitude1)
			lat2 = to_rad(self.lat)
			long1 = to_rad(longittude1)
			long2 = to_rad(self.lng)
			dLat = lat2-lat1   
  			dLon = lon2-lon1
	  		a = Math::sin(dLat/2) * Math::sin(dLat/2) + Math::cos(lat1) * Math::cos(lat2) *  Math::sin(dLon/2) * Math::sin(dLon/2);
	  		c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a));
	  		distance = radius * c
	  		return distance
		end

		def to_rad angle
	  		angle * Math::PI / 180
		end
	end
end

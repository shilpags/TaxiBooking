module Fare
        class CalculateFare
	def calculate_fare(color=nil)
                if color == 'pink'
                        fare = (5 + (2*distance))
                        tax=(10/100 * 2)
                        total = (fare + tax)
        	else
                	fare = (2*distance)
                	tax = (10/100 * 2)
                	total = (fare + tax)
        	end
		return total
	end
        end
end


 require "party_invitation/version"
 require './config/initializers/constants.rb'
 require 'json'

 class PartyInvitation

 	#This method converts degree value of cordinate into radians
 	def self.degree_to_radians(coordinates_in_degree)
 		coordinates_in_radians = coordinates_in_degree * Math::PI / 180
 	end


 	#This Method calculate the distance of a customer from Intercom office,
 	#If customer id within 100 KM then it returns TRUE else FALSE
 	def self.find_distance(source_lat, source_long, dest_lat, dest_long)
 		if (EARTH_RADIUS*(Math::acos(Math::sin(source_lat)*Math::sin(dest_lat)+Math::cos(source_lat)*Math::cos(dest_lat)*Math::cos(source_long - dest_long)))) < MAX_DISTANCE
 			return true
 		else 
 			return false
 		end
 	end

 	

    # This Method gives the list of eligible Invites (invitation_list) 
    # List includes the users within 100 KM or Intercom Office
    def self.invite_customer
    	invitations = Hash.new
    	intercom_lat = degree_to_radians(INTERCOM_LATITUDE)
    	intercom_long = degree_to_radians(INTERCOM_LONGITUDE)
    	
    	#Read the customer Information from the customer.json file

    	customer_data = File.read(PATH)
    	customer_data.each_line do |customer|
			customer = JSON.parse customer
				raise "ParserError" if customer_data.nil?
			customer_id = customer["user_id"]
			customer_name = customer["name"]
			customer_lat = degree_to_radians(customer["latitude"].to_f)
			customer_long = degree_to_radians(customer["longitude"].to_f)

    		#Find the users withing 100KM range of Intercom office and 
    		if find_distance(intercom_lat, intercom_long, customer_lat, customer_long)

    			if true

 					#Add valid user in invitation
 					invitations[customer_id] = customer_name

 				end
 			end
 		end


 		# Sort the user list by user_id's and print the list
 		@invitation_list = invitations.sort_by{|id, name| id}
 		# print_invitation_list(invitation_list)
 		return @invitation_list
 	end

 	def self.print_invitation_list
 		invite_customer
 		@invitation_list.each{|id, name| puts "#{id} #{name}"}
 	end



 end

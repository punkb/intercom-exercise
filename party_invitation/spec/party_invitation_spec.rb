#Class to be tested
require 'party_invitation'

#Test Date 
require './data/test_data.rb'

#Unit Tests
describe PartyInvitation do
	
	#Test Degree to Radian functionality
	 describe ".degree_to_radians" do
	 	context "given INTERCOM_LAT_DEG" do
	 		it "should give INTERCOM_LAT_RAD" do
	 			expect(PartyInvitation.degree_to_radians(INTERCOM_LAT_DEG)).to eql(INTERCOM_LAT_RAD)
	 		end
	 	end
	 end

	#Test coordinate distance > 100 KM
	 describe ".find_distance" do
	 	context "given The User: Alice Cahill" do
	 		it "should give > 100 KM hence it should return false" do
	 			expect(PartyInvitation.find_distance(INTERCOM_LAT_RAD, INTERCOM_LONG_RAD, Alice_lat_rad, Alice_long_rad)).to eq(false)
	 		end
	 	end
	 end

	 #Test coordinates distance < 100 KM 
	 describe ".find_distance" do
	 	context "given the user: Ian Kehoe" do
	 		it "should give < 100 KM hence it should return true. Ian Kehoe is within 100 KM of Intercom Office" do
	 			expect(PartyInvitation.find_distance(INTERCOM_LAT_RAD, INTERCOM_LONG_RAD,  Ian_lat_rad, Ian_long_rad)).to eq(true)
	 		end
	 	end
	 end

	 #Test Coordinate distance = 0 KM
	 describe ".find_distance" do
	 	context "given the user present at Intercom Office" do
	 		it "should return true. As the user is at Intercom Office" do
	 			expect(PartyInvitation.find_distance(INTERCOM_LAT_RAD, INTERCOM_LONG_RAD, INTERCOM_LAT_RAD, INTERCOM_LONG_RAD)).to eq(true)
	 		end
	 	end
	 end



	#Test Costomer Invitation list should not be empty
	describe ".invite_customer" do
		context "Run the Invite Customer Method" do
			it "should not give the empty user list" do
				expect(PartyInvitation.invite_customer).not_to be_empty
		    end
		end
	end	

	#Test To be Invitest customer is in the list
	describe ".invite_customer" do
		context "Run the Invite Customer Method" do
			it "should give list of users eligible for the invite" do
				expect(PartyInvitation.invite_customer).to include([24, "Rose Enright"])
		    end
		end
	end	

	#Test 'Not To be Invitest' customer is not in the list
	describe ".invite_customer" do
		context "Run the Invite Customer Method" do
			it "should give list of users eligible for the invite" do
				expect(PartyInvitation.invite_customer).not_to include([1, "Alice Cahill"])
		    end
		end
	end	

	#Test invitation list is getting print with sorting order 
	describe ".print_invitation_list" do
		context "Print the invitation list" do
			it "should print the invitation list sorted with user id, and contains User Id and Name" do
				expect(PartyInvitation.print_invitation_list).to include([24, "Rose Enright"])
			end
		end
	end



end
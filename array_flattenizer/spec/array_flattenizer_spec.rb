require "array_flattenizer"

describe ArrayFlattenizer do
	describe ".flatten_the_array" do
		context "given [1, 2, [3, 4], [5]]" do
			it "returns [1, 2, 3, 4, 5]" do
				expect(ArrayFlattenizer.flatten_the_array([1, 2, [3, 4], [5]])).to eql([1, 2, 3, 4, 5])
			end
		end
	end


	#Test the array of all Negative Integers
	describe ".flatten_the_array" do
		context "given [-1, -2, [-3]]" do
			it "should give [-1, -2, -3]" do
				expect(ArrayFlattenizer.flatten_the_array([-1, -2, [-3]])).to eql([-1, -2, -3])
			end
		end
	end


   #Test for empty array
	describe ".flatten_the_array" do
		context "given [[[]],[]]" do
			it "returns []" do
				expect(ArrayFlattenizer.flatten_the_array([[[]],[]])).to eql([])
			end
		end
	end
 
    #Test for an Array of Empty arrays and single element.
	describe ".flatten_the_array" do
		context "given [[3, []],[]]" do
			it "returns [3]" do
				expect(ArrayFlattenizer.flatten_the_array([[3, []],[]])).to eql([3])
			end
		end
	end


	#Test the Empty Input
	describe ".flatten_the_array" do
		context "given Empty array" do
			it "should raise an ArgumentError" do
				expect{ArrayFlattenizer.flatten_the_array([])}.to raise_error(ArgumentError)
			end
		end
	end
  

    #Test for No Argument
	describe ".flatten_the_array" do
		context "given no Argument" do
			it "should raise an ArgumentError" do
				expect{ArrayFlattenizer.flatten_the_array}.to raise_error(ArgumentError)
			end
		end
	end


	#Test the array full of characters
	describe ".flatten_the_array" do
		context "given [w, e, r]" do
			it "should raise a NameError" do
				expect{ArrayFlattenizer.flatten_the_array([w, e, r])}.to raise_error(NameError)
			end
		end
	end



	#Test the of strings

	describe ".flatten_the_array" do
		context "given 'String'" do
			it "should raise a TypeError" do
				expect{ArrayFlattenizer.flatten_the_array("String")}.to raise_error(TypeError)
			end
		end
	end

	#Tedt of single integer Fixnum

	describe ".flatten_the_array" do
		context "given 4" do
			it "should raise a TypeError" do
				expect{ArrayFlattenizer.flatten_the_array(4)}.to raise_error(TypeError)
			end
		end
	end


	#Test the array of chracter and numbers
    describe ".flatten_the_array" do
		context "given [2, [3, 4, [e]]]" do
			it "should raise a NameError" do
				expect{ArrayFlattenizer.flatten_the_array([2, [3, 4, [e]]])}.to raise_error(NameError)
			end
		end
	end



	#Test the array of characters, numbers and strings
	describe ".flatten_the_array" do
		context "given [2, [3, ['String 1', 'String 2'], [e]]]" do
			it "should raise a NameError" do
				expect{ArrayFlattenizer.flatten_the_array([2, [3, ['String 1', 'String 2'], [e]]])}.to raise_error(NameError)
			end
		end
	end


	#Test the array of RegEx
	describe ".flatten_the_array" do
		context 'given [(a+b), [(1+2), (4/2)]]' do
			it "should raise a NameError" do
				expect{ArrayFlattenizer.flatten_the_array([(a+b), [(1+2), (4/2)]])}.to raise_error(NameError)

			end
		end
	end

end
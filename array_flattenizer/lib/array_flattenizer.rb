require "array_flattenizer/version"


class ArrayFlattenizer


	#This method will accept and validate the given input array
	def self.flatten_the_array(input_array)

		#If Given Inout is not an Array
		if !input_array.is_a?(Array)
			raise TypeError, "Input is not valid"
		end

		#If Given input is empty
		if input_array.empty?
			raise ArgumentError, "Array is empty"
		end

		# Initialize a new array to store the flattened elements
		@flattened_array = Array.new

		#If given Input is an Array then flatten it 
		flatten_element_array(input_array)
		
		return @flattened_array
	end


	private

	#This method flatten the Arbitory array elements / Inner Elements
	def self.flatten_element_array(element_array)

		# Start eaterating through each element of the Input array
		element_array.each do |element|

			# This loop will check the element is an array or Fix Number.
			if element.is_a?(Array)
				flatten_element_array(element)
			elsif element.is_a?(Fixnum)
				@flattened_array << element
			elsif !element.is_a? [a-z]
				raise NameError, "Array contains Characters or Symbols or Regular Expression"						
								
			end
		end

	end
end

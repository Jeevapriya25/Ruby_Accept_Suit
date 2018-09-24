require 'authorizenet' 

module Api
 module V1
 	class AcceptSuiteServiceController < ApplicationController

 		def CreateCustomer()
	 		response = create_customer_payment_profile(nil)
	 		puts response
 	    end
 	end
 end
end
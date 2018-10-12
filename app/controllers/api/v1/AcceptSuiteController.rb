# require 'authorizenet' 
# require 'authorizenetsample'

module Api
	module V1
		class AcceptjsController < ApplicationController
			def Test
			 response = create_an_accept_payment_transaction()
				# puts response
				render json:{success: 'SUCCESS',message: 'Created transaction',data:},status: :ok
			end
		end
	end
end



# Test()
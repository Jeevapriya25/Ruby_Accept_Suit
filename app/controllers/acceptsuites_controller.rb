require 'authorizenetsample'
class AcceptsuitesController < ApplicationController
	def acceptJs
		# puts "test"
		response = create_an_accept_payment_transaction()
		
		if response != nil
      	if response.messages.resultCode == MessageTypeEnum::Ok
        if response.transactionResponse != nil && response.transactionResponse.messages != nil
          puts "Successful charge (auth + capture) (authorization code: #{response.transactionResponse.authCode})"
          puts "Transaction Response code: #{response.transactionResponse.responseCode}"
          puts "Code: #{response.transactionResponse.messages.messages[0].code}"
			  puts "Description: #{response.transactionResponse.messages.messages[0].description}"
			  render json: {status: "true",messgae:response.transactionResponse.responseCode,data:response.transactionResponse.authCode},status: :ok
        else
          puts "Transaction Failed"
          if response.transactionResponse.errors != nil
            puts "Error Code: #{response.transactionResponse.errors.errors[0].errorCode}"
			puts "Error Message: #{response.transactionResponse.errors.errors[0].errorText}"
			render json: {status: "false",message:response.transactionResponse.errors.errors[0].errorText,data:response.transactionResponse.errors.errors[0].errorCode},status: :ok
          end
        #   raise "Failed to charge card."
        end
      else
        puts "Transaction Failed"
        if response.transactionResponse != nil && response.transactionResponse.errors != nil
          puts "Error Code: #{response.transactionResponse.errors.errors[0].errorCode}"
		  puts "Error Message: #{response.transactionResponse.errors.errors[0].errorText}"
		  render json: {status: "false",message:response.transactionResponse.errors.errors[0].errorText,data:response.transactionResponse.errors.errors[0].errorCode},status: :ok
        else
          puts "Error Code: #{response.messages.messages[0].code}"
		  puts "Error Message: #{response.messages.messages[0].text}"
		  render json: {status: "false",message:response.messages.messages[0].text,data:response.messages.messages[0].code},status: :ok
        end
        # raise "Failed to charge card."
      end
    else
	  puts "Response is null"
	  render json: {status: "false",data:"Response is null"},status: :ok
    #   raise "Failed to charge card."
    end
	end
end

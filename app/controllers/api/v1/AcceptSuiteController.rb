require 'authorizenet' 
# require_relative '../../../../../sample-code-ruby-master/sample-code-ruby-master/PaymentTransactions/create-an-accept-payment-transaction.rb'
require 'authorizenetSample'


def Test
	response = create_an_accept_payment_transaction()
	puts response
end

Test()
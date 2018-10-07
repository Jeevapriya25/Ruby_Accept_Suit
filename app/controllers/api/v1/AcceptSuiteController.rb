require 'authorizenet' 
require 'authorizenetsample'


def Test
	response = create_an_accept_payment_transaction()
	puts response
end

Test()
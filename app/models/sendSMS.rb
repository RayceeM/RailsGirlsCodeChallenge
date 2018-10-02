# Include the helper gateway class
require './AfricasTalkingGateway'
# Specify your login credentials
username = "sandbox";
apikey   = "8e9d691f3ba1337cb6e02aec174ce3305e444d6a5e0694b727a9cb7aa8cabc13";
# Specify the numbers that you want to send to in a comma-separated list
# Please ensure you include the country code (+254 for Kenya in this case, +256 for Uganda)
to      = "+254704532657,+254702756406";
# And of course we want our recipients to know what we really do
message = "I'm a lumberjack and it's ok, I sleep all night and I work all day"
# Create a new instance of our awesome gateway class
gateway = AfricasTalkingGateway.new(username, apikey)
# Any gateway error will be captured by our custom Exception class below,
# so wrap the call in a try-catch block
begin
  # Thats it, hit send and we'll take care of the rest.
  reports = gateway.sendMessage(to, message)
  
  reports.each {|x|
    # status is either "Success" or "error message"
    puts 'number=' + x.number + ';status=' + x.status + ';statusCode=' + x.statusCode + ';messageId=' + x.messageId + ';cost=' + x.cost
  }
rescue AfricasTalkingGatewayException => ex
  puts 'Encountered an error: ' + ex.message
end
# DONE!
require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

@@rolodex = Rolodex.new   #instantiating the class var with @@ 

get '/' do
	@crm_app_name = "MY CRM"
	erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do 
	erb :new_contact
end 

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  @@rolodex.add_contact(new_contact)
  redirect to('/contacts')
end




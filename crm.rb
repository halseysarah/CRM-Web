require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

@@rolodex = Rolodex.new   #instantiating the class var with @@ 

@@rolodex.add_contact(Contact.new("Sarah", "Halsey", "HalseySarah@Gmail.com", "Note To Self!"))

get '/' do
	@crm_app_name = "Sarah's CRM"
	erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do 
	erb :new_contact
end 

get "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  erb :show_contact
end


post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  @@rolodex.add_contact(new_contact)
  redirect to('/contacts')
end





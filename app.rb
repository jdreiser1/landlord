require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  erb :"index"
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

get '/apartments/:id' do
  if params[:apartment][:id] != ""
    @apt = Apartment.find(params[:apartment][:id])
  else
    @apt = Apartment.find_by(address: params[:apartment][:address])
  end
  erb :"apartments/show"
end

get '/apartments/tenantdetails' do
  if params[:apartment][:id] != ""
    @apt = Apartment.find(params[:apartment][:id])
  else
    @apt = Apartment.find_by(address: params[:apartment][:address])
  end
  erb :"apartments/tenant_details"
end

get 'apartments/:id/edit' do
  @apt = Apartment.find(params[:id])
  erb :"apartments/edit"
end

post '/apartments' do
  Apartment.create(params[:apartment])
  redirect '/apartments'
end

post '/tenants' do
  Tenant.create(params[:tenant])
  redirect '/apartments/tenantdetails'
end

delete '/apartments/:id' do
  Apartment.find(params[:id]).destroy
  redirect '/apartments'
end

require('pry-byebug')
require_relative('../models/Log.rb')

get '/history' do
  @logs = Log.all()
  erb(:"/history/index")
end

get '/history/filters/create' do
  @logs = Log.all_by_category("create")
  @category = "create"
  erb(:"/history/filter")
end

get '/history/filters/update' do
  @logs = Log.all_by_category("update")
  @category = "update"
  erb(:"/history/filter")
end

get '/history/filters/delete' do
  @logs = Log.all_by_category("delete")
  @category = "delete"
  erb(:"/history/filter")
end

get '/history/filters/owner-change' do
  @logs = Log.all_by_category("owner change")
  @category = "owner change"
  erb(:"/history/filter")
end

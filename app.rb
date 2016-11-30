require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/cd')
require('pry')

get('/') do
  erb(:index)
end

get('/cds/new') do
  erb(:cds_form)
end

get('/cds') do
  @cds = CD.all()
  erb(:cds)
end

post('/success') do
  binding.pry
  erb(:success)
end

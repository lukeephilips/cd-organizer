require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/cd')
require('pry-nav')

get('/') do
  erb(:index)
end

get('/artists/new') do
  erb(:artists_form)
end

post('/artists') do
  name = params.fetch("name")
  Artist.new(name).save()
  @artists = Artist.all()
  erb(:artists)
end

get('/artists') do
  @artists = Artist.all()
  erb(:artists)
end

get('/cds/new') do
  erb(:cds_form)
end

get('/cds') do
  @cds = CD.all()
  erb(:cds)
end

post('/cds') do
  artist = params.fetch("artist")
  album = params.fetch("album")
  CD.new(artist, album).save()
  @cds = CD.all()
  erb(:success)
end

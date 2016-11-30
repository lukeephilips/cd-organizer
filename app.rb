require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/cd')
require("./lib/artists")
require('pry-nav')

get('/') do
  erb(:index)
end

get('/artists/new') do
  erb(:artists_form)
end

post('/artists') do
  name = params.fetch("name")
  artist = Artist.new(name)
  artist.save()
  @artists = Artist.all()
  erb(:artists)
end

get('/artists') do
  @artists = Artist.all()
  erb(:artists)
end

get('/artists/:id') do
  @artist = Artist.find(params.fetch('id').to_i())
  erb(:cds_artists_form)
end

post('/artists/:id/artist') do
  album = params.fetch("album")
  @cd = CD.new(album)
  @cd.save()
  @artist = Artist.find(params.fetch('id').to_i)
  @artist.add_album(@cd)
  erb(:artist)
end
get('/artists/:id/artist') do
  @artist = Artist.find(params.fetch('id').to_i)
  erb(:artist)
end

get('/cds/new') do
  erb(:cds_form)
end

get('/cds') do
  @cds = CD.all()
  erb(:cds)
end

post('/cds') do
  album = params.fetch("album")
  CD.new(album).save()
  @cds = CD.all()
  erb(:success)
end

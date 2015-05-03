require 'sinatra'

#Read

get '/notes' do
  @notes = Note.all.sort { |a, b| b.updated_at <=> a.updated_at }
  erb :"notes/display"
end

#Create

get '/notes/new' do
  @note = Note.new 
  erb :"notes/new"
end

post '/notes' do
  @note = Note.create(
    title: params[:title],
    content: params[:content]
    )
  redirect "/notes"
end

#Update

get '/notes/:id/edit' do
  @note = Note.where(id: params[:id]).first
  erb :"notes/edit"
end

put '/notes/:id' do
  @note = Note.where(id: params[:id]).first
  @note.title = params[:title]
  @note.content = params[:content]
  @note.save

  redirect "/notes"
end

#Delete
 
get '/notes/:id/delete' do
  @note = Note.where(id: params[:id]).first
  erb :"notes/delete"
end

delete '/notes/:id' do
  @note = Note.where(id: params[:id]).first
  @note.destroy
  redirect "/notes"
end

class LandmarksController < ApplicationController
  
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
    # binding.pry
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
    if !params[:landmark][:year_completed].empty?
      @landmark.year_completed = params[:landmark][:year_completed]
    end
    params[:id] = @landmark.id
    redirect "/landmarks/#{@landmark.id}"
  end

  patch '/landmarks/:id' do
    # binding.pry
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:landmark][:name])
    if !params[:landmark][:year_completed].empty?
      @landmark.update(year_completed: params[:landmark][:year_completed])
    end
    params[:id] = @landmark.id
    redirect "/landmarks/#{@landmark.id}"
  end

end

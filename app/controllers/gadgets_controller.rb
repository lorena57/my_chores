class GadgetsController < ApplicationController

 get '/chores/:id/gadgets/new' do
  
    if logged_in?
      @chore = Chore.find(params[:id])
      
      erb :'gadgets/new'
    else
      erb :'sessions/login'
    end
  end

  #Refactor post

  post '/chores/:id' do
    if params.values.any? {|value| value == ""}
      @chore = Chore.find(params[:id])
      erb :'gadgets/new'
    else
      @chore = Chore.find(params[:id])
      @gadget = Gadget.new(gizmo: params[:gizmo])
      @gadget.save
      @chore.gadgets << @gadget
      redirect to "/chores/#{@chore.id}"
    end
  end

  # delete '/chores/:id/gadgets/:gadget_id/delete' do 
  #   @chore = Chore.find(params[:id])
  #   @gadget = Gadget.find(params[:gadget_id])
  #   if logged_in?
  #     @chore = Chore.find(params[:id])
  #   if @chore.user_id == session[:user_id]
  #       @gadget = Gadget.find(params[:gadget_id])
  #       @gadget.delete
  #       redirect to "/chores/#{@chore.id}"
  #   else
  #     redirect to "/chores/#{@chore.id}"
  #   end
  #   else
  #     erb :'sessions/login'
  #   end
  # end

end
class GadgetsController < ApplicationController

    get '/gadgets' do
      authorize
      @gadgets = Gadget.all
      erb :'gadgets/index'
   end

   get 'gadgets/new' do
      authorize
      erb :'gadgets/new'
   end
    
end   
   

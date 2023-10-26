class SearchesController < ApplicationController
before_action :authenticate_user!

def search
    @range = params[:range]

    if @range == "Item"
      @item = Item.looks(params[:search], params[:word])
    end
end

end

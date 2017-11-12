class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to(:users_show)
    else
      flash[:error] = "There was an error saving the item. Please try again."
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
       flash[:notice] = "Item was deleted successfully."
       redirect_to(:users_show)
     else
       flash.now[:alert] = "There was an error deleting the item."
     end
  end
    private
  def item_params
    params.require(:item).permit(:name, :user)
  end
end

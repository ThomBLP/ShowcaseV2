class ItemsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @item = Item.new
    @category_id = params[:category_id]
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash.notice = "Nouvel item crée!"
      redirect_to category_path(@item.category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @category = Category.find(params[:category_id])
    @items = @category.items

    if params[:search].present?
      search_term = "#{params[:search].downcase}%" # Ajoutez % pour rechercher les mots commençant par la recherche
      search_field = params[:search_in] # Champ de recherche sélectionné

      case search_field
      when 'name'
        @items = @items.where("LOWER(name) LIKE ?", search_term)
      when 'description'
        @items = @items.where("LOWER(description) LIKE ?", "%#{params[:search].downcase}%")
      else
        @items = @items.where("LOWER(name) LIKE ? OR LOWER(description) LIKE ?", search_term, "%#{params[:search].downcase}%")
      end
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  def edit
    @category = Category.find(params[:category_id])
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to category_path(@item.category)
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to category_path(@item.category)
  end
end


private

def item_params
  params.require(:item).permit(:name, :description, :category_id, :id, photos: [])
end

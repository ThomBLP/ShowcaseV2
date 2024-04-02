class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash.notice = "Nouvelle catégorie créee!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])

    @items = @category.items.paginate(page: params[:page], per_page: 20)
  end


  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path
  end
end

private

def category_params
  params.require(:category).permit(:name, :description, :photo)
end

class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @categories=Category.all
    @category=Category.new
  end

  def create
    @category=Category.new(category_params)
    @category.save
    redirect_to admin_categories_path
  end

  def destroy
    @category=Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  def update
    @category=Category.find(params[:id])
    @category.update(category_params)
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

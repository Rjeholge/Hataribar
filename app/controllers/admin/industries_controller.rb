class Admin::IndustriesController < ApplicationController

  def index
    @industries = Industry.all
    @industry = Industry.new
  end

  def edit
    @industry = Industry.find(params[:id])
  end

  def update
    @industry = Industry.find(params[:id])
   if @industry.update(industry_params)
      redirect_to admin_industries_path
   else
      render :edit
   end
  end

  def create
    @indsutry = Industry.new(genre_params)
    if @industry.save
      redirect_to admin_industries_path
    else
      @industries = Industry.all
      render :index
    end
  end

  private

  def industry_params
    params.require(:industry).permit(:industry)
  end


end
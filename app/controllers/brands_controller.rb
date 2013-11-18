class BrandsController < ApplicationController

  def index
    @brands = Brand.paginate(page: params[:page])
  end

  def show
    @brand = Brand.find(params[:id])
    @brand_sizes = BrandSize.joins(:brand).where(brands: { name: @brand.name })
  end
end

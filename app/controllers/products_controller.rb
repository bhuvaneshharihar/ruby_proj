class ProductsController < ApplicationController

    def new
        @product = Product.new
    end

    def index
        @products = Product.all
    end
    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to new_product_path, notice: "Product created"
        else
            render :new
            e
        end     
    end

    private

    def product_params
        params.require(:product).permit(:name, :size, :price)
    end

end

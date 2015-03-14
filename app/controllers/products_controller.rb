class ProductsController < ApplicationController
  layout "user", only: [:index, :new, :show, :edit]

end

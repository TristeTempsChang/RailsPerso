# crud_controller.rb
class CrudController < ApplicationController
    def index
      @crud = Crud.new
      @user_count = User.all.length
      @product_count = Crud.count
      @contact_count = Contact.count
      if session[:user_id]
        @user = User.find_by(id: session[:user_id])
      end
      @products = Crud.includes(:creator).all
    end

    def create_from_index
        @crud = Crud.new(crud_params)
    
        if @crud.save
          redirect_to root_path
        else
          redirect_to crud_index_path
        end
    end

    def update_from_index
      
    end

    def delete_from_index
      selected_product_ids = params[:selected_products]
      ap selected_product_ids
      Crud.where(id: selected_product_ids).destroy_all
      redirect_to crud_index_path
    end
    
    
      private
    
      def crud_params
        params.require(:crud).permit(:nom, :nombre, :date, :creationBy)
      end
end
  
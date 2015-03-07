class ApplicationController < ActionController::Base
  before_action :pass_breadcrumbs
  before_filter :configure_permitted_parameters

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    if controller_name == "registrations"
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
        :email, :firstname, :lastname, :password, :password_confirmation)
      }
    end
  end

  def pass_breadcrumbs
    @breadcrumbs = []

    if not current_user or not current_user.id or devise_controller? or controller_name == "profile"
      return
    end

    @breadcrumbs.push view_context.link_to "Home", controller: "categories", action: "index"

    if defined? category and not category.id.nil?
      @breadcrumbs.push( "Category: " + view_context.link_to( category.name, category_path( category ) ) )

      if defined? product and not product.id.nil?
        @breadcrumbs.push( "Product: " + view_context.link_to(
          product.title, category_product_path( category.id, product )
        ) )
      end
    end
  end
end

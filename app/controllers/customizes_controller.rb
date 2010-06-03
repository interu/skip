class CustomizesController < ApplicationController
  # Ajaxで変更しやすいようにchange_skinを追加
  %w(update change_skin).each do |method_name|
    define_method method_name do
      update_user_custom(params[:user_custom])
      redirect_to root_url
    end
  end

private
  def update_user_custom(custom_info)
    @user_custom = current_user.custom
    if @user_custom.update_attributes(custom_info)
      setup_custom_cookies(@user_custom)
      flash[:notice] = _('Updated successfully.')
    end
  end
end

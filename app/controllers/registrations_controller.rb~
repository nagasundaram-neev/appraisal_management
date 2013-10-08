class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
    @role = Role.new
    p "-------------------------------------"
    p "-------------------------------------"
    p "-------------------------------------"
    p self.inspect
    self.inspect
    @role.save_role_user(self.id.params[:role_id][:id],params[:aprsl_cycl_id][:id])
  end

end

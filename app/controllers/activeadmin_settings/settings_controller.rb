class ActiveadminSettings::SettingsController < ApplicationController
  before_action :authenticate_user!

  def update
    @object = ActiveadminSettings::Setting.find(params[:id])
    @object.assign_attributes(permitted_params[:setting])
    if @object.valid?
      @object.save!
      render :plain => @object.value
    else
      render :plain => @object.errors.full_messages.join(', '), status: 422
    end
  end

  private
  def permitted_params
    params.permit!
  end
end

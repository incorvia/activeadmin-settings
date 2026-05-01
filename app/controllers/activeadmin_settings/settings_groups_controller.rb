class ActiveadminSettings::SettingsGroupsController < ApplicationController
  include Pundit

  unless ActiveAdmin.application.authentication_method.nil?
    before_action ActiveAdmin.application.authentication_method
  end

  before_action :set_cache_headers

  def show
    group = ActiveadminSettings::SettingsGroupsBuilder.new.groups(slug: params[:slug]).first
    return head :not_found unless group

    render partial: "admin/settings/settings_table", locals: { settings: group[:settings] }
  end

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "private, no-store"
  end
end

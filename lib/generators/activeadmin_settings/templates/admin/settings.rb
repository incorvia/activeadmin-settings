ActiveAdmin.register_page "Settings" do
  content do
    groups = ActiveadminSettings::SettingsGroupsBuilder.new.groups
    render  partial: 'index', locals: { groups: groups }
  end
end

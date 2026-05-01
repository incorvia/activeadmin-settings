module ActiveadminSettings
  class SettingsGroupsBuilder
    def groups(slug: nil)
      requested_slug = slug.to_s
      configured_groups = ActiveadminSettings.groups
      configured_groups = configured_groups.select { |group| group[:slug] == requested_slug } unless requested_slug.empty?

      settings_by_name = {}
      ActiveadminSettings::Setting.all.each do |setting|
        settings_by_name[setting.name] = setting
      end

      configured_groups.map do |group|
        hydrated_group = group.dup
        hydrated_group[:settings] = group[:default_settings].each_key.map do |name|
          settings_by_name[name] || ActiveadminSettings::Setting.initiate_setting(name)
        end
        hydrated_group
      end
    end
  end
end

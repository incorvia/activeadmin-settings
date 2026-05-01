module ActionDispatch::Routing
  class Mapper
    def mount_activeadmin_settings
      scope '/admin', module: "activeadmin_settings" do
        resources :settings, only: [:update]
        get "settings/groups/:slug", to: "settings_groups#show", as: :settings_group
      end
    end
  end
end
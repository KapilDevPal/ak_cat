ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Hindu Gods" do
          ul do
            BxBlockGod::God.order(created_at: :desc).limit(5).map do |god|
              li link_to(god.name, admin_bx_block_god_god_path(god))
            end
          end
        end
      end

      column do
        panel "System Statistics" do
          para "Total Hindu Gods: #{BxBlockGod::God.count}"
          para "Total Users: #{User.count}" if defined?(User)
        end
      end
    end
  end
end 
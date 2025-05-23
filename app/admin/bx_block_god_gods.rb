ActiveAdmin.register BxBlockGod::God do
  menu priority: 2, label: "Hindu Gods"
  
  permit_params :name, :sanskrit_name, :description, :significance, :festivals, :temples, :mantras, :image_url, :image

  index do
    selectable_column
    id_column
    column :name
    column :sanskrit_name
    column :description do |god|
      truncate(god.description, length: 100)
    end
    column :festivals
    column :created_at
    actions
  end

  filter :name
  filter :sanskrit_name
  filter :festivals
  filter :created_at

  form do |f|
    f.inputs "God Details" do
      f.input :name
      f.input :sanskrit_name
      f.input :description, as: :text
      f.input :significance, as: :text
      f.input :festivals
      f.input :temples
      f.input :mantras
      f.input :image_url
      f.input :image, as: :file if f.object.respond_to?(:image)
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :sanskrit_name
      row :description
      row :significance
      row :festivals
      row :temples
      row :mantras
      row :image_url
      row :created_at
      row :updated_at
      if resource.respond_to?(:image) && resource.image.attached?
        row :image do |god|
          image_tag url_for(god.image), width: 200
        end
      end
    end
  end
end 
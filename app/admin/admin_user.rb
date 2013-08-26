ActiveAdmin.register AdminUser do
  menu label: 'Users'

  index do
    column :first_name
    column :last_name
    column :username
    column :email
    column :gender
    column :role
    column :slug
    column :sign_in_count

    default_actions
  end

  filter :first_name
  filter :last_name
  filter :username
  filter :email
  filter :gender
  filter :birthday
  filter :zipcode
  filter :role
  filter :slug
  filter :created_at
  filter :updated_at

  show do
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :email
      row :gender
      row :birthday
      row :zipcode
      row :about_me do
        raw admin_user.about_me
      end
      row :profile_pic do
        image_tag admin_user.profile_pic
      end
      row :role do
        admin_user.role == 1 ? 'User' : 'Admin'
      end
      row :type
      row :slug
      row :sign_in_count
      row :encrypted_password
      row :reset_password_token
      row :remember_created_at
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs '' do
      f.input :first_name
      f.input :last_name
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :gender, as: 'radio', collection: [ [ 'Male', true ], [ 'Female', false ] ]
      f.input :birthday
      f.input :zipcode
      f.input :about_me
      f.input :profile_pic
      f.input :role, as: 'select', include_blank: false, collection: [ [ 'User', USER ], [ 'Admin', ADMIN ] ]
      f.input :slug
    end

    f.actions
  end
end
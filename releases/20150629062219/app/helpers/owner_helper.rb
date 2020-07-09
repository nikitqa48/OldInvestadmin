module OwnerHelper
  def owner_select f
    capture_haml do
      if current_user.role? :admin
        haml_concat form_group(f, :owner_id, :select, User.all.map { |user| ["#{user.role_label} #{user.email}", user.id] }, {}, {class: 'form-control simple-chosen'})
      else
        haml_concat f.hidden_field(:owner_id, value: current_user.id)
      end
    end
  end
end
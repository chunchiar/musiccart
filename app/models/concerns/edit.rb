class Edit < ActiveRecord::Base
  rails_admin do
    edit do
      include_all_fields
      field :content, :text do
        ckeditor true
      end
    end
  end
end

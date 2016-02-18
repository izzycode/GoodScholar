class ChangeEmailNotNullInUser < ActiveRecord::Migration

#changed: def changed
#         end
# to allow rollback of database because at going to "UP" state we created emails, so the machine cannot undo that but we can tell it that it'a ok to have a null emails

  def up
    #set default for users with no email
    User.where(email: nil).each do |user|
      user.email = "#{user.name}@wyncode.co"
      user.save
    end
    change_column :users, :email, :string, null: false;
  end

  def down

  end

end

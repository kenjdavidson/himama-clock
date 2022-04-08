class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    execute "insert into roles (name, created_at, updated_at) values ('ADMIN', now(), now())"
    execute "insert into roles (name, created_at, updated_at) values ('TEACHER', now(), now())"
  end
end

namespace :users do
  desc 'Populate sample users data'

  task test_users: :environment do
    User.destroy_all

    admin = User.create!(given_name: 'Office',
                         surname: 'Administrator',
                         email: 'admin@teachers.com',
                         password: 'p@ssword',
                         password_confirmation: 'p@ssword',
                         pincode: '1234')
    admin.roles << Role.find_by(name: 'ADMIN')
    admin.roles << Role.find_by(name: 'TEACHER')

    teacher1 = User.create!(given_name: 'Teacher',
                            surname: 'One',
                            email: 'tone@teachers.com',
                            password: 'p@ssword',
                            password_confirmation: 'p@ssword',
                            pincode: '1234')
    teacher1.roles << Role.find_by(name: 'TEACHER')

    teacher2 = User.create!(given_name: 'Teacher',
                            surname: 'Two',
                            email: 'ttwo@teachers.com',
                            password: 'p@ssword',
                            password_confirmation: 'p@ssword',
                            pincode: '1234')
    teacher2.roles << Role.find_by(name: 'TEACHER')
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do
    @user = User.new(given_name: 'User',
                     surname: 'Test',
                     email: 'user.test@email.com',
                     password: 'p@ssword',
                     password_confirmation: 'p@ssword',
                     pincode: '1234')
  end

  subject { @user }

  describe '#given_name' do
    it { should respond_to?(:given_name) }

    context 'is empty' do
      before { @user.given_name = '' }
      it { should_not be_valid }
    end

    context 'is nil' do
      before { @user.given_name = nil }
      it { should_not be_valid }
    end
  end

  describe '#surname' do
    it { should respond_to?(:surname) }

    context 'is empty' do
      before { @user.surname = '' }
      it { should_not be_valid }
    end

    context 'is nil' do
      before { @user.surname = nil }
      it { should_not be_valid }
    end
  end

  describe '#email' do
    it { should respond_to?(:given_name) }

    context 'is empty' do
      before { @user.email = '' }
      it { should_not be_valid }
    end

    context 'is nil' do
      before { @user.email = nil }
      it { should_not be_valid }
    end

    context 'has duplicate email' do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.save
      end

      it { should_not be_valid }
    end
  end

  describe '#password' do
    it { should respond_to?(:password_digest) }
    it { should respond_to?(:password) }
    it { should respond_to?(:password_confirmation) }

    context 'is empty' do
      before { @user.password = @user.password_confirmation = '' }
      it { should_not be_valid }
    end

    context 'is nil' do
      before { @user.password = @user.password_confirmation = nil }
      it { should_not be_valid }
    end

    context 'does not match password_confirmation' do
      before { @user.password = 'different' }
      it { should_not be_valid }
    end

    context 'is less than min length' do
      before { @user.password = @user.password_confirmation = 'AAAA' }
      it { should_not be_valid }
    end
  end

  describe '#pincode' do
    it { should respond_to?(:pincode_digest) }
    it { should respond_to?(:pincode) }

    context 'is empty' do
      before { @user.pincode = '' }
      # it { should_not be_valid }
    end

    context 'is nil' do
      before { @user.pincode = nil }
      it { should_not be_valid }
    end

    context 'is less than 4 digits' do
      before { @user.pincode = '999' }
      it { should_not be_valid }
    end

    context 'is more than 9 digits' do
      before { @user.pincode = '9999999999' }
      it { should_not be_valid }
    end

    context 'contains alpha' do
      before { @user.pincode = 'A1234' }
      it { should_not be_valid }
    end
  end

  describe '#roles' do
    it { should respond_to?(:roles) }
  end

  describe '#has_role?' do
    before { @user.roles << Role.new(name: 'ADMIN') }

    it 'has ADMIN role' do
      expect(@user.has_role?(:admin)).to be(true)
    end

    it 'does not have TEACHER role' do
      expect(@user.has_role?(:teacher)).to be(false)
    end
  end

  describe '#full_name' do
    it { should respond_to?(:full_name) }
  end
end

require 'rails_helper'

RSpec.describe TimeEvent, type: :model do
  before(:example) do
    @user = User.new(given_name: 'User',
                     surname: 'Test',
                     email: 'user.test@email.com',
                     password: 'p@ssword',
                     password_confirmation: 'p@ssword',
                     pincode: '1234')
    @time_event = TimeEvent.new(user: @user,
                                event_time: Time.now,
                                event_type: :clock_in)
  end

  subject { @time_event }

  describe '#user' do
    it { should respond_to?(:user) }

    context 'is nil' do
      before { @time_event.user = nil }
      it { should_not be_valid }
    end
  end

  describe '#event_time' do
    it { should respond_to?(:event_time) }

    context 'is nil' do
      before { @time_event.event_time = nil }
      it { should be_valid }
    end
  end

  describe '#event_type' do
    it { should respond_to?(:event_type) }
    it { should respond_to?(:clock_in?) }
    it { should respond_to?(:clock_out?) }

    context 'is nil' do
      before { @time_event.event_type = nil }
      it { should_not be_valid }
    end
  end
end

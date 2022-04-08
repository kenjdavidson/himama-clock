require 'rails_helper'

RSpec.describe Role, type: :model do
  before(:example) do
    @role = Role.new(name: 'ADMIN')
  end

  subject { @role }

  describe '#name' do
    it { should respond_to?(:name) }

    context 'is empty' do
      before { @role.name = '' }
      it { should_not be_valid }
    end

    context 'is nil' do
      before { @role.name = nil }
      it { should_not be_valid }
    end
  end

  describe '#users' do
    it { should respond_to?(:users) }
  end
end

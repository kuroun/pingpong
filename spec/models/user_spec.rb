require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validate association' do
    it { should have_many(:logs).with_foreign_key(:player_one) }
    it { should have_many(:opponents) }
    it { should have_many(:inverse_logs).class_name('Log').with_foreign_key(:player_two) }
    it { should have_many(:inverse_opponents) }
  end

end

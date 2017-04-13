require 'rails_helper'

RSpec.describe Log, type: :model do

  describe '#validate present of' do
    it { should validate_presence_of(:player_one) }
    it { should validate_presence_of(:player_one) }
    it { should validate_presence_of(:player_one_score) }
    it { should validate_presence_of(:player_two_score) }
    it { should validate_presence_of(:played_date) }
  end

  describe '#validate score' do
    it { should_not allow_value("blah").for(:player_one_score) }
    it { should_not allow_value("blah").for(:player_two_score) }
    it { should allow_value(1).for(:player_one_score) }
    it { should allow_value(1).for(:player_two_score) }
    it { should validate_inclusion_of(:player_one_score).in_range(0..21) }
    it { should validate_inclusion_of(:player_two_score).in_range(0..21) }
  end
end

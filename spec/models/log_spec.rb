require 'rails_helper'

RSpec.describe Log, type: :model do

  describe 'validate present of' do
    it { should validate_presence_of(:player_two) }
    it { should validate_presence_of(:player_one_score) }
    it { should validate_presence_of(:player_two_score) }
    it { should validate_presence_of(:played_date) }
  end

  describe 'validate score' do
    it { should_not allow_value("blah").for(:player_one_score) }
    it { should_not allow_value("blah").for(:player_two_score) }
    it { should allow_value(1).for(:player_one_score) }
    it { should allow_value(1).for(:player_two_score) }
    it { should validate_inclusion_of(:player_one_score).in_range(0..21) }
    it { should validate_inclusion_of(:player_two_score).in_range(0..21) }
  end

  describe 'validate association' do
    it { should belong_to(:user).class_name('User').with_foreign_key(:player_one) }
    it { should belong_to(:opponent).class_name('User').with_foreign_key(:player_two) }
  end

  describe '#update_leaderboard' do
    let(:user1) { User.create(:email => 'top_geek1@gmail.com',:password => '12345678', :score => 0) }
    let(:user2) { User.create(:email => 'top_geek2@gmail.com',:password => '12345678', :score => 0) }
    before(:each) do 
      Log.create(
      :player_one => user1.id, 
      :player_two => user2.id, 
      :played_date => Time.now,
      :player_one_score => 21,
      :player_two_score => 0
      )
    end

    it 'expect user1 has update score' do
      expect(User.where(:id => user1.id).pluck(:score).first).to be > 0
    end

    it 'expect user2 has no update score' do
      user2.save
      expect(User.where(:id => user2.id).pluck(:score).first).to eq 0
    end
  end
end

require 'rails_helper'

RSpec.describe "logs/edit", type: :view do
  before(:each) do
    @log = assign(:log, Log.create!(
      :player_one => 1,
      :player_two => 1,
      :player_one_score => 1,
      :player_two_score => 1
    ))
  end

  it "renders the edit log form" do
    render

    assert_select "form[action=?][method=?]", log_path(@log), "post" do

      assert_select "input#log_player_one[name=?]", "log[player_one]"

      assert_select "input#log_player_two[name=?]", "log[player_two]"

      assert_select "input#log_player_one_score[name=?]", "log[player_one_score]"

      assert_select "input#log_player_two_score[name=?]", "log[player_two_score]"
    end
  end
end

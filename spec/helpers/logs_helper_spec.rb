require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LogsHelper. For example:
#
# describe LogsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe LogsHelper, type: :helper do
  
  describe '#result' do
  	context 'score1 is greater than score 2' do
  		it 'expect to return W' do
  			expect(result(21, 0)).to eq 'W'
  		end
  	end

  	context 'score2 is greater than score 1' do
  		it 'expect to return L' do
  			expect(result(14, 21)).to eq 'L'
  		end
  	end

  	context 'score1 is equal score 2' do
  		it 'expect to return D' do
  			expect(result(21, 21)).to eq 'D'
  		end
  	end
  end
end

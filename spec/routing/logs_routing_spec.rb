require "rails_helper"

RSpec.describe LogsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/logs").to route_to("logs#index")
    end

    it "routes to #new" do
      expect(:get => "/logs/new").to route_to("logs#new")
    end

    it "routes to #create" do
      expect(:post => "/logs").to route_to("logs#create")
    end

  end
end

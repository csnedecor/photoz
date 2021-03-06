require "rails_helper"

describe Visit do

  describe "attributes" do
    it { should respond_to :album }
    it { should respond_to :ip_address }
    it { should respond_to :created_at }
    it { should respond_to :updated_at }
  end

  describe "associations" do
    it { should belong_to :album }
  end

  describe ".daily_visits_to_csv" do
    let(:album) { FactoryGirl.create(:album) }

    subject { Visit.daily_visits_to_csv(album) }

    it { should include "Pageviews" }
    it { should include "UniqueVisits" }
    it { should include "x" }
  end
end

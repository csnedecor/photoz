require "rails_helper"

describe Hit do
  describe "attributes" do
    it { should respond_to :album }
    it { should respond_to :created_at }
    it { should respond_to :updated_at }
  end

  describe "associations" do
    it { should belong_to :album }
  end
end

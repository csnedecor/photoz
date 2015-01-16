require "rails_helper"

describe Visit do

  describe "attributes" do
    it { should respond_to :album }
    it { should respond_to :ip_address }
  end

end

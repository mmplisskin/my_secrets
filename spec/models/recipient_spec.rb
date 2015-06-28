require 'rails_helper'

RSpec.describe Recipient, type: :model do
    it "is a valid recipient" do
        recipient= Recipient.new(email: "busyra@me.com")
        expect(recipient).to be_valid
    end	
    it "is a valid post with multiple a recipients" do
        recipient= Recipient.new(email: "busyra@me.com, max@awesome.com, niels@bomb.com")
        expect(recipient).to be_valid
    end
end

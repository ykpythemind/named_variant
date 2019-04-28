require "rails_helper"

RSpec.describe "named variant" do
  describe "User has one attached avater" do
    let(:user) { create_user_with_attached_avater }

    it "avater file is attached" do
      expect(user.avater.attached?).to eq true
    end
  end
end

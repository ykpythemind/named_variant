require "rails_helper"

RSpec.describe "named variant" do
  describe "User has one attached avater" do
    let(:user) { create_user_with_attached_avater }

    it "avater file is attached" do
      expect(user.avater.attached?).to eq true
    end
  end

  describe "calling ActiveStorage::Blob#variant and process" do
    let(:user) { create_user_with_attached_avater }

    subject { user.avater.variant(*args).processed }

    context do
      let(:args) { { resize: "200x200" } }
      it "Original variant calling is available" do
        is_expected.to be_a ActiveStorage::Variant
      end
    end

    context do
      let(:args) { :small }
      it "Named variant calling is available" do
        is_expected.to be_a ActiveStorage::Variant
      end
    end
  end
end

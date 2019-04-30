require "rails_helper"

RSpec.describe "named variant" do
  describe "User has one attached avatar" do
    let(:user) { create_user_with_attached_avatar }

    it "avatar file is attached" do
      expect(user.avatar.attached?).to eq true
    end
  end

  describe "calling ActiveStorage::Blob#variant and process" do
    let(:user) { create_user_with_attached_avatar }

    subject { user.avatar.variant(args).processed }
    before do
      variant = NamedVariant::Variant.new(resize: "200x200")

      allow(NamedVariant).to receive(:find_named_variant_for).and_return(variant)
    end

    context do
      let(:args) { { resize: "200x200" } }
      it "Original variant calling is available" do
        is_expected.to be_a ActiveStorage::Variant
      end

      specify "options" do
        expect(subject.variation.transformations).to eq args
      end
    end

    context do
      let(:args) { :small }
      it "Named variant calling is available" do
        is_expected.to be_a ActiveStorage::Variant
      end

      specify "options" do
        expect(subject.variation.transformations).to eq({ resize: "200x200" })
      end
    end
  end

  describe "ActiveRecord macro" do
    it do
      expect(NamedVariant.named_variants["User/xsmall"]).to be nil
      User.send(:variant, :xsmall, resize: "20x20")
      expect(NamedVariant.named_variants["User/xsmall"]).not_to be nil
    end
  end
end

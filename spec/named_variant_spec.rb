require "rails_helper"

RSpec.describe do
  describe "User has one attached avatar" do
    let(:user) { create_user_with_attached_avatar }

    it "avatar file is attached" do
      expect(user.avatar.attached?).to eq true
    end
  end

  describe "User has many attached images" do
    let(:user) { create_user_with_attached_images }

    it "image files are attached" do
      expect(user.images.attached?).to eq true
      expect(user.images.count).to eq 2
    end
  end

  describe "calling ActiveStorage::Blob#variant and process" do
    let(:user) { create_user_with_attached_avatar }

    subject { user.avatar.variant(args).processed }

    context "original variant" do
      let(:args) { { resize: "200x200" } }
      it "Original variant calling is available" do
        is_expected.to be_a ActiveStorage::Variant
      end

      specify "options" do
        expect(subject.variation.transformations).to eq args
      end
    end

    context "named variant" do
      let(:args) { :medium }

      it "Named variant calling is available" do
        is_expected.to be_a ActiveStorage::Variant
      end

      specify "options" do
        expect(subject.variation.transformations).to eq({ resize: "500x500", auto_orient: true })
      end
    end

    context "undefined variant" do
      let(:args) { :small }

      it "raises VariantNotFound" do
        expect { subject }.to raise_error(NamedVariant::VariantNotFound)
      end
    end
  end

  describe "store variant configuration to NamedVariant.named_variants" do
    it do
      expect(NamedVariant.named_variants["User/xsmall"]).not_to be_nil
    end
  end

  describe "has_many_attached" do
    let(:user) { create_user_with_attached_images }

    it "can call variant" do
      expect(user.images.first.variant(:xsmall)).to be_a ActiveStorage::Variant
    end
  end
end

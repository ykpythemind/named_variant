require "named_variant/railtie"

module NamedVariant
  mattr_reader :named_variants, default: {}

  module VariantExtension
    # prepend ActiveStorage::Blob::Representable#variant
    # https://github.com/rails/rails/blob/3c823271af52a61e825123def170fe2187057577/activestorage/app/models/active_storage/blob/representable.rb#L28
    def variant(args)
      if args.is_a?(Symbol)
        # binding.irb
        # self is ActiveStorage::Attached
        transformation_args = ::NamedVariant.find_named_variant_for(args).to_h
        return super(transformation_args)
      end

      super
    end
  end

  def self.find_named_variant_for(sym)
    named_variants[sym]
  end
end

require "named_variant/variant"

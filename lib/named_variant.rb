require "named_variant/railtie"

module NamedVariant
  module VariantExtension
    # override ActiveStorage::Blob::Representable#variant
    # https://github.com/rails/rails/blob/3c823271af52a61e825123def170fe2187057577/activestorage/app/models/active_storage/blob/representable.rb#L28
    def variant(args)
      if args.is_a?(Symbol)
        transformation_args = { resize: "200x200" }
        return super(**transformation_args)
      end

      super
    end
  end
end

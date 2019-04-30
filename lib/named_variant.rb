require "named_variant/railtie"

module NamedVariant
  mattr_reader :named_variants, default: {}

  module VariantExtension
    # prepend ActiveStorage::Blob::Representable#variant
    # https://github.com/rails/rails/blob/3c823271af52a61e825123def170fe2187057577/activestorage/app/models/active_storage/blob/representable.rb#L28
    def variant(args)
      if args.is_a?(Symbol)
        # self is ActiveStorage::Attached::One
        transformation_args =
          ::NamedVariant.find_named_variant_for(
            klass: self.record.class,
            sym: args
        ).to_h
        return super(transformation_args)
      end

      super
    end
  end

  module ActiveRecordExtension
    def variant_name(name, **opts)
      ::NamedVariant.add_variant("#{self}/#{name}", opts) ## key looks like: User/xsmall
    end
  end

  def self.find_named_variant_for(klass: nil, sym:)
    # NOTE: name params
    named_variants["#{klass}/#{sym}"] || named_variants[sym.to_s]
  end

  def self.add_variant(name, opts)
    named_variants[name.to_s] = Variant.new(opts)
  end
end

require "named_variant/variant"

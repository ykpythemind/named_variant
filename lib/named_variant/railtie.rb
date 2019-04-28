module NamedVariant
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      ActiveStorage::Blob.prepend NamedVariant::VariantExtension
    end
  end
end

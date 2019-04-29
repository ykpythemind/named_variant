module NamedVariant
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      ActiveStorage::Attached.prepend ::NamedVariant::VariantExtension
    end
  end
end

module NamedVariant
  class Railtie < ::Rails::Railtie
    ActiveSupport.on_load(:active_record) do
      ActiveRecord::Base.extend ::NamedVariant::ActiveRecordExtension
      ActiveStorage::Attachment.prepend ::NamedVariant::VariantExtension
    end

    config.after_initialize do
      ActiveStorage::Attached::One.prepend ::NamedVariant::VariantExtension
    end
  end
end

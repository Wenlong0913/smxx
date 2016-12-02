class ItemGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument :attributes, type: :array, default: [], banner: "field field"

  def copy_files
    template 'model.rb', "app/models/#{file_name}.rb"
  end

  hook_for :cud, as: :model, default: 'cud'
  hook_for :decorator, as: :model, default: 'decorator'
  hook_for :test_framework, as: :model
end

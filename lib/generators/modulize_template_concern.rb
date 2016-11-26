module Generators
  module ModulizeTemplateConcern
    extend ActiveSupport::Concern

    included do
      class_option :module, type: :string, banner: 'admin, agent or member', desc: 'Default: the first part of path(admin/product, module is admin)'
    end

    # Support scaffold module template
    def find_in_source_paths(file)
      m_file = nil
      m = options[:module].presence || name.split('/')[0..-2].first
      if file == 'controller.rb' && m
        m_file = "#{m}/controller.rb"
        super(m_file)
      else
        super(file)
      end
    rescue Thor::Error => e
      if m_file && e.message =~ /^Could not find /
        say "Can't find #{m_file}, use default controller.rb", :yellow unless @behavior == :revoke
        return super(file)
      else
        raise
      end
    end

  end
end

module CatalogResourcesRoute
  def self.extended(router)
    router.instance_exec do
      def catalog_resources_for(klass, options = {})
        resources klass.name.underscore.pluralize, options.merge(controller: 'catalogs', klass: klass.name)
      end
    end
  end
end

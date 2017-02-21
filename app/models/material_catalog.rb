class MaterialCatalog < Catalog
  audited
  store_accessor :features, :settings
  def full_name
    if parent
      "#{parent.full_name}/#{name}"
    else
      "#{name}"
    end
  end
end

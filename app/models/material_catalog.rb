class MaterialCatalog < Catalog
  audited

  def full_name
    if parent
      "#{parent.full_name}/#{name}"
    else
      "#{name}"
    end
  end
end

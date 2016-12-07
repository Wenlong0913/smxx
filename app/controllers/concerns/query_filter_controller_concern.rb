module QueryFilterControllerConcern
  def build_query_filter(query, options = {})
    options = options.symbolize_keys
    column_names =
      if options[:only]
        Array(options[:only])
      elsif options[:except]
        @admin_trees.attribute_names - Array(options[:except]).map(&:to_s)
      else
        @admin_trees.attribute_names
      end

    filters = params[:filters].present? ? params[:filters].select { |k, v| v.present? } : []
    filters.slice!(*column_names)

    keywords = params[:keywords].presence

    return query if keywords.blank? && filters.blank?

    if filters.any?
      query      = []
      conditions = []

      filters.each_pair do |k, v|
        query << "#{k} = ?"
        conditions << v
      end

      conditions.unshift query.join(' AND ')

      query = query.where(conditions)
    end

    if keywords
      query      = []
      conditions = []

      column_names.each_pair do |k, v|
        query << "#{k} = ?"
        conditions << v
      end

      conditions.unshift query.join(' OR ')

      query = query.where(conditions)
    end

    query
  end
end

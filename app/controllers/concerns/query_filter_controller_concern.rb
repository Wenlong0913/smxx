module QueryFilterControllerConcern
  def build_query_filter(collection, options = {})
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
    filters.slice!(*column_names) if filters.present?

    keywords = params[:search] && params[:search][:keywords].presence
    return collection if keywords.blank? && filters.blank?

    if filters.any?
      query      = []
      conditions = []

      filters.each_pair do |k, v|
        query << "#{k} = ?"
        conditions << v
      end

      conditions.unshift query.join(' AND ')

      collection = collection.where(conditions)

      begin
        collection.first
      rescue ActiveRecord::StatementInvalid
        collection = []
      end
    end

    return collection if collection.blank?
    if keywords
      query      = []
      conditions = []

      column_names.each do |k|
        query << "#{k} = ?"
        conditions << keywords
      end

      conditions.unshift query.join(' OR ')

      collection = collection.where(conditions)
    end

    collection
  end
end

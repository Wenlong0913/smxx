module QueryFilterControllerConcern
  def build_query_filter(relation, options = {})
    options = options.symbolize_keys
    model = relation.model
    column_names =
      if options[:only]
        Array(options[:only])
      elsif options[:except]
        model.attribute_names - Array(options[:except]).map(&:to_s)
      else
        model.attribute_names
      end

    filters = params[:filters].present? ? params[:filters].select { |k, v| v.present? } : {}

    keywords = params[:search] && params[:search][:keywords].presence
    return relation if keywords.blank? && filters.blank?

    if filters.any?
      query      = []
      conditions = []

      filters.each_pair do |k, v|
        v = format_query_filter_value(model, k, v)
        if v
          query << "#{k} = ?"
          conditions << v
        end
      end

      conditions.unshift query.join(' AND ')
      relation = relation.where(conditions)
    end

    if keywords
      query      = []
      conditions = []

      column_names.each do |k|
        v = format_query_filter_value(model, k, keywords)
        if v
          query << "#{k} = ?"
          conditions << v
        end
      end

      conditions.unshift query.join(' OR ')

      relation = relation.where(conditions)
    end

    relation
  end

  def format_query_filter_value(model, k, v)
    case model.columns_hash[k.to_s].type
    when :integer
      v = nil if v =~ /[^0-9]/
    when :datetime
      v = DateTime.parse(v) rescue nil
    end
    v
  end
end

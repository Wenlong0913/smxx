class MemberCatalog < ApplicationRecord
  audited
  validates_presence_of :key
  validates_uniqueness_of :key

  # ['a', 'b'] => {a, b}
  def psql_value
    s = '{'
    s << value.join(',')
    s << '}'
    s
  end
end

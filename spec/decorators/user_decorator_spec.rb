require 'rails_helper'

RSpec.describe UserDecorator do
  subject { User.new.decorate }
  it { should be_decorated }
  it { should respond_to :display_name, :headshot, :display_role }
end

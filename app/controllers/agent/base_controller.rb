class Agent::BaseController < ApplicationController
  acts_as_themeable 'color_admin'
  layout 'layouts/agent'
end

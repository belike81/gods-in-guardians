class Updaters::Base
  def initialize(api = ApiWrapper.new)
    @api = api
  end
end

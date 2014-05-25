class ApiConstraints
  def initialize(options)
    @version = options.fetch(:version)
    @default = options.fetch(:default){ false }
  end

  def matches?(req)
    @default || req.headers
                  .fetch(:accept)
                  .include?("application/vnd.articles.v#{@version}")
  end
end

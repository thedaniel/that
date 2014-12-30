module That
  module Core
    DEFAULT_TO_THAT_KEYS = [:name, :login, :email]
    def that(query)
      query = query.to_s
      # Make sure all models are loaded
      Rails.application.eager_load!

      # Find out what symbols are AR subclasses
      models = Module.constants.collect do |constant_name|
        constant = eval(constant_name.to_s)
        if not constant.nil? and constant.is_a? Class and constant.superclass == ActiveRecord::Base
          constant
        end
      end
      models.compact!

      results = []
      # Query everything!
      models.each do |model|
        keys = model.respond_to?(:to_that) ? model.to_that : DEFAULT_TO_THAT_KEYS
        keys.each do |key|
          results += model.where(key => query) if model.column_names.include?(key.to_s)
        end

      end
      results.length == 1 ? results.first : results
    end
    alias_method :dat, :that
  end

  def self.activate
    Object.send(:include, That::Core) # lol
  end
end

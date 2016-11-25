require "keyword_struct/version"

module KeywordStruct
  def self.new(*attrs, &block)
    Class.new do
      # Define readers
      attr_reader *attrs

      define_method :initialize do |**kwargs|
        # Check all arguments are present
        missing_args = attrs.reject { |a| kwargs.key?(a) }

        unless missing_args.empty?
          message = (missing_args.length == 1) ? "missing keyword: #{missing_args.first}" : "missing keywords: #{missing_args.join(', ')}"
          fail ArgumentError, message
        end

        # Store arguments
        attrs.each do |attr|
          instance_variable_set("@#{attr}", kwargs[attr])
        end
      end

      # Custom methods
      class_eval &block if block
    end
  end
end

class LeanInteractor::GenerateInitializeMethod
  def self.for(argument_names)
    argument_list = argument_names.join(', ')
    method_definition = "define_method(:initialize) do |#{argument_list}|"
    body = argument_names.map { |argument_name| "@#{argument_name} = #{argument_name}" }

    [method_definition, body, 'end'].join("\n")
  end
end

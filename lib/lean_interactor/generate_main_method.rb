class LeanInteractor::GenerateMainMethod
  def self.for(base_class_name, method_name, argument_names)
    argument_list = argument_names.join(', ')
    method_definition = "def #{base_class_name}.#{method_name}(#{argument_list})"
    body = "new(#{argument_list}).run"

    [method_definition, body, 'end'].join("\n")
  end
end

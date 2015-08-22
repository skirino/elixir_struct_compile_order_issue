defmodule M do
  defmacro __using__(_) do
    quote do
      try do
        NonexistingModule.module_info
      rescue
        _undefined_function_error -> nil
      end

      defstruct [:field1]
    end
  end
end

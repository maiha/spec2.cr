module Spec2
  module Factory
    macro abstract
      module Factory
        # We commented out because compiler trictly checks the type of the return value in crystal-0.36 or above.
        # ```
        # Error: this method overrides Spec2::Runner::Factory#build() which has an explicit return type of Spec2::Factory.
        # ```
#       abstract def build : {{@type}}
      end
    end
  end
end

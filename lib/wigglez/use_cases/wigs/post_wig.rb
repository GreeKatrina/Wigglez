require 'pry-byebug'

module Wigglez
  class PostWig < UseCase

    def run(params)
      # params that should always be set to nil when wig is created
      not_required_params = [:tracking_number, :receiver_id, :date_picked, :received]
      for param_name in not_required_params
        params[param_name] = nil
      end
      # put both of these in an array incase I want to add more to either later
      optional_params = [:retail_estimate, :construction, :size]
      for param_name in optional_params
        params[param_name] = nil if !params[param_name]
      end

      result = validate_params(params) do
        validates_presence_of :donor_id, :material, :color, :length, :gender, :condition
      end

      if !result.valid?
        return failure(:invalid_params, :reasons => result.errors.messages)
      end

      wig = Wigglez.db.create_wig(params)
      return success(wig: wig)
    end

  end
end

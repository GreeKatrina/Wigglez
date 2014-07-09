module Wigglez
  class PostWig < UseCase

    def run(wig, donor_id)

      puts wig
      # put both of these in an array incase I want to add more to either later
      optional_params = [:retail_estimate, :construction, :size, :style, :texture]
      for param_name in optional_params
        wig[param_name] = nil if !wig[param_name]
      end

      result = validate_params(wig) do
        validates_presence_of :material, :color, :length, :gender, :condition
        validates :material, :inclusion => { :within => ['human hair', 'synthetic'] }
        validates :color, :inclusion => { :within => ['blonde', 'black', 'dark brown', 'medium brown', 'light brown', 'red', 'white', 'grey', 'other'] }
        validates :length, :inclusion => { :within => ['short', 'medium', 'long'] }
        validates :gender, :inclusion => { :within => ['male', 'female'] }
        validates :condition, :inclusion => { :within => ['poor', 'fair', 'lightly used', 'new'] }
      end

      if !result.valid?
        return failure(:invalid_params, :reasons => result.errors.messages)
      end

      donor = Wigglez.db.get_user(donor_id)
      if !donor
        return failure(:invalid_params, :reasons => { :donor_id => ["The donor is not registered."] })
      end

      wig[:donor_id] = donor.id
      new_wig = Wigglez.db.create_wig(wig)
      return success(wig: new_wig)
    end

  end
end

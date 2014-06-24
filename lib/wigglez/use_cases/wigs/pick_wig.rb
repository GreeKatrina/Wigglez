require 'pry-byebug'
require 'time'

module Wigglez
  class PickWig < UseCase

    def run(wig_id, receiver_id)
      receiver = Wigglez.db.get_user(receiver_id)

      if !receiver
        return failure(:invalid_params, :reasons => { :receiver_id => ["The receiver is not registered."] })
      end

      wig = Wigglez.db.get_wig(wig_id)



      if !result.valid?
        return failure(:invalid_params, :reasons => result.errors.messages)
      end

      Wigglez.db.get_wig(wig.id)
      return success(wig: new_wig)

    end

  end
end

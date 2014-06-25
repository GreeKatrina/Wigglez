require 'pry-byebug'
require 'time'

module Wigglez
  class PickWig < UseCase

    def run(wig_id, receiver_id)
      receiver = Wigglez.db.get_user(receiver_id)

      if !receiver
        return failure(:invalid_params, :reasons => { :receiver => ["The receiver is not registered."] })
      end

      wig = Wigglez.db.get_wig(wig_id)
      if !wig
        return failure(:invalid_params, :reasons => { :wig => ["That wig does not exist."] } )
      end

      t = DateTime.now
      new_wig = Wigglez.db.update_wig(wig_id, {receiver_id: receiver_id, date_picked: t})
      return success(wig: new_wig)
    end

  end
end

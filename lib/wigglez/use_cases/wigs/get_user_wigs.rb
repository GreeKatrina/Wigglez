require 'pry'

module Wigglez
  class GetUserWigs
    def run(user_id)
      wigs = Wigglez.db.all_wigs
      selected_wigs = wigs.select {|wig| wig.donor_id == user_id}
      return selected_wigs
    end

    def not_picked(user_id)
      wigs = Wigglez.db.all_wigs
      selected_wigs = wigs.select {|wig| wig.donor_id == user_id && wig.receiver_id == nil}
      return selected_wigs
    end

    def not_received(user_id)
      wigs = Wigglez.db.all_wigs
      selected_wigs = wigs.select {|wig| wig.receiver_id == user_id && wig.received == nil}
      return selected_wigs
    end
  end
end

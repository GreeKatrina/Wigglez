module Wigglez
  class GetUserWigs
    def run(user_id)
      wigs = Wigglez.db.all_wigs
      wigs.select {|wig| wig.donor_id == user_id}
      return wigs
    end
  end
end

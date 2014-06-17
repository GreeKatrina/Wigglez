require 'pry-byebug'

module Wigglez
  module Database
    class InMemory
      def initialize
        @users = {}
        @users_id_counter = 100
        @sessions = {}
        @sessions_id_counter = 100
        @wigs = {}
        @wigs_id_counter = 500
      end

      def create_user(attrs)
        new_id = (@users_id_counter += 1)
        @users[new_id] = attrs
        attrs[:id] = new_id
        User.new(attrs[:id], attrs[:name], attrs[:email], attrs[:password], attrs[:password_confirmation])
      end

      def get_user(id)
        attrs = @users[id]
        User.new(attrs[:id], attrs[:name], attrs[:email], attrs[:password], attrs[:password_confirmation])
      end

      def create_session(attrs)
        new_id = (@sessions_id_counter += 1)
        @sessions[new_id] = attrs
        return new_id
      end

      def get_user_by_session_id(sid)
        return nil if @sessions[sid].nil?
        user_id = @sessions[sid][:user_id]
        user_attrs = @users[user_id]
        User.new(user_attrs[:id], user_attrs[:name], user_attrs[:email], user_attrs[:password], user_attrs[:password_confirmation])
      end

      def get_user_by_email(email)
        user_attrs = @users.values.find { |attrs| attrs[:email] == email }
        return nil if user_attrs.nil?
        User.new(user_attrs[:id], user_attrs[:name], user_attrs[:email], user_attrs[:password], user_attrs[:password_confirmation])
      end

      def create_wig(attrs)
        new_id = (@wigs_id_counter += 1)
        @wigs[new_id] = attrs
        attrs[:id] = new_id
        attrs[:receiver] = 1 if attrs[:gender].nil?
        attrs[:tracking_number] = nil if attrs[:tracking_number].nil?
        attrs[:received] = false if attrs[:received].nil?
        attrs[:material] = 'synthetic' if attrs[:material].nil?
        attrs[:color] = 'brown' if attrs[:color].nil?
        attrs[:length] = 'long' if attrs[:length].nil?
        attrs[:gender] = 'female' if attrs[:gender].nil?
        attrs[:retail_estimate] = nil if attrs[:retail_estimate].nil?
        attrs[:date_picked] = nil if attrs[:date_picked].nil?
        attrs[:condition] = 'fair' if attrs[:condition].nil?
        attrs[:construction] = 'stock' if attrs[:construction].nil?
        attrs[:size] = 'average' if attrs[:size].nil?
        Wig.new(
          attrs[:id],
          attrs[:donor],
          attrs[:receiver],
          attrs[:tracking_number],
          attrs[:received],
          attrs[:material],
          attrs[:color],
          attrs[:length],
          attrs[:gender],
          attrs[:retail_estimate],
          attrs[:date_picked],
          attrs[:condition],
          attrs[:construction],
          attrs[:size]
        )
      end

      def get_wig(id)
        wig_attrs = @wigs[id]
        return nil if wig_attrs.nil?
        Wig.new(
          wig_attrs[:id],
          wig_attrs[:donor],
          wig_attrs[:receiver],
          wig_attrs[:tracking_number],
          wig_attrs[:received],
          wig_attrs[:material],
          wig_attrs[:color],
          wig_attrs[:length],
          wig_attrs[:gender],
          wig_attrs[:retail_estimate],
          wig_attrs[:date_picked],
          wig_attrs[:condition],
          wig_attrs[:construction],
          wig_attrs[:size]
        )
      end

      def all_wigs
        @wigs.values.map do |attrs|
          Wig.new(
            attrs[:id],
            attrs[:donor],
            attrs[:receiver],
            attrs[:tracking_number],
            attrs[:received],
            attrs[:material],
            attrs[:color],
            attrs[:length],
            attrs[:gender],
            attrs[:retail_estimate],
            attrs[:date_picked],
            attrs[:condition],
            attrs[:construction],
            attrs[:size]
          )
        end
      end

      def CLEAR_ALL
      end

    end
  end
end

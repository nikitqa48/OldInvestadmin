require "user_resource/user_resource"
ActiveRecord::Base.send(:include, UserResource)
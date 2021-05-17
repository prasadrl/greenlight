# frozen_string_literal: true
class AddRecordPermission < ActiveRecord::Migration[5.2]
  def up
    Role.all.each do |role|
      roompermission = role.role_permissions.find_by(name: "can_create_rooms")
      role.role_permissions.create(name: "can_record", value: (roompermission == nil || roompermission.value == nil) ? "false" : roompermission.value, enabled: true)
    end
  end
  def down
    Role.all.each do |role|
      role.role_permissions.find_by(name: "can_record").destroy
    end
  end
end

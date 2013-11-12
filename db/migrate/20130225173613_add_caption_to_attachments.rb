class AddCaptionToAttachments < ActiveRecord::Migration
change_table :attachments do |t|
  t.string :caption
end
end

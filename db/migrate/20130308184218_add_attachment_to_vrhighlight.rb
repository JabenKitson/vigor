class AddAttachmentToVrhighlight < ActiveRecord::Migration
change_table :attachments do |t|
  t.references :vrhighlight
end
end

class AddAttachmentReferences < ActiveRecord::Migration
change_table :attachments do |t|
  t.references :user
  t.references :event
  t.references :recipe
  t.references :vegresource
  t.references :post
  t.references :review
end
end

class AddMetaToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :photo_meta, :text

  end
end

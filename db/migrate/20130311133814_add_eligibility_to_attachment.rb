class AddEligibilityToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :eligibility, :integer

  end
end

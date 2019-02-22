class Entries::UpdateWalletBalance
  attr_accessor :entry

  def initialize entry_id
    @entry = Entry.find(entry_id)
  end

  def perform
    
  end
end
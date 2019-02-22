class Entries::UndoUpdateWalletBalance
  attr_reader :entry_id

  def initialize entry_id
    @entry = Entry.find(entry_id)
  end

  def perform
    if entry.is_expense
      entry.wallet.update_attributes balance: (balance + entry.amount)
    else
      entry.wallet.update_attributes balance: (balance - entry.amount)
    end
  end
end

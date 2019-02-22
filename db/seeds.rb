# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "========== Rake seed start !!! =========="
wallets = Wallet.create(
  [
    {
      id: 1,
      name: "Cường & Hường Wallet",
      balance: 60000000
    }
  ]
)
puts "========== Created #{wallets.count} Wallets =========="

users = User.create(
  [
    {
      name: "Ngọc Cường",
      wallet_id: 1
    },
    {
      name: "Thu Hường",
      wallet_id: 1
    }
  ]
)
puts "========== Created #{users.count} Users =========="

categories = Category.create(
  [
    {
      is_expense: true,
      name: "Bank debt",
      description: "Tiền trả lãi và gốc vay ngân hàng hàng tháng",
      wallet_id: 1
    },
    {
      is_expense: true,
      name: "House Bills",
      description: "Tiền điện, nước, ga, gửi xe, quản lý chung cư, phí internet...",
      wallet_id: 1
    },
    {
      is_expense: true,
      name: "Food & Drink",
      description: "Tiền ăn sáng, ăn trưa, mua thức ăn",
      wallet_id: 1
    },
    {
      is_expense: true,
      name: "Shopping",
      description: "Tiền mua đồ dùng",
      wallet_id: 1
    },
    {
      is_expense: true,
      name: "Family",
      description: "Tiền biếu người thân, quà tặng cho người thân",
      wallet_id: 1
    },
    {
      is_expense: true,
      name: "Children & Baby",
      description: "Tiền chi phí các khoản cho em bé",
      wallet_id: 1
    },
    {
      is_expense: true,
      name: "Health & Fitness",
      description: "Tiền viện phí, khám bệnh, mua thuốc, phí tập thể hình, làm đẹp, cắt tóc...",
      wallet_id: 1
    },
    {
      is_expense: true,
      name: "Transportation",
      description: "Tiền đi taxi, đi xe khách, tiền sửa xe, rửa xe...",
      wallet_id: 1
    },
    {
      is_expense: true,
      name: "Gift",
      description: "Tiền quà tặng, tiền mừng cưới, ma chay...",
      wallet_id: 1
    },
    {
      is_expense: true,
      name: "Entertainment",
      description: "Tiền đi chơi, đi du lịch",
      wallet_id: 1
    },
    {
      is_expense: true,
      name: "Education",
      description: "Tiền mua sách vở, đăng ký khoá học",
      wallet_id: 1
    },
    {
      is_expense: true,
      name: "Insurances",
      description: "Tiền bảo hiểm",
      wallet_id: 1
    },
    {
      is_expense: true,
      name: "Other expense",
      description: "Các loại tiền khác",
      wallet_id: 1
    },
    {
      is_expense: false,
      name: "Salary",
      description: "Tiền lương",
      wallet_id: 1
    },
    {
      is_expense: false,
      name: "Partime",
      description: "Tiền lương làm ngoài",
      wallet_id: 1
    },
    {
      is_expense: false,
      name: "Other income",
      description: "Tiền được cho tặng...",
      wallet_id: 1
    }
  ]
)
puts "========== Created #{categories.count} Categories =========="

budgets = Budget.create(
  [
    {
      month: Date.today.beginning_of_month,
      category_id: 1,
      amount: 12500000
    },
    {
      month: Date.today.beginning_of_month,
      category_id: 2,
      amount: 1400000
    },
    {
      month: Date.today.beginning_of_month,
      category_id: 3,
      amount: 4000000
    },
    {
      month: Date.today.beginning_of_month,
      category_id: 4,
      amount: 1000000
    },
    {
      month: Date.today.beginning_of_month,
      category_id: 5,
      amount: 8000000
    },
    {
      month: Date.today.beginning_of_month,
      category_id: 6,
      amount: 5000000
    },
    {
      month: Date.today.beginning_of_month,
      category_id: 7,
      amount: 1000000
    },
    {
      month: Date.today.beginning_of_month,
      category_id: 8,
      amount: 1000000
    },
    {
      month: Date.today.beginning_of_month,
      category_id: 9,
      amount: 2000000
    },
    {
      month: Date.today.beginning_of_month,
      category_id: 10,
      amount: 0
    },
    {
      month: Date.today.beginning_of_month,
      category_id: 11,
      amount: 0
    },
    {
      month: Date.today.beginning_of_month,
      category_id: 12,
      amount: 2000000
    },
    {
      month: Date.today.beginning_of_month,
      category_id: 13,
      amount: 0
    },
  ]
)
puts "========== Created #{budgets.count} Budgets =========="

entries = Entry.create(
  [
    {
      user_id: 1,
      category_id: 3,
      date: Date.new(2019,2,20),
      amount: 30000,
      description: "Ăn bún bò giò ốc tại KeangNam"
    },
    {
      user_id: 2,
      category_id: 8,
      date: Date.new(2019,2,19),
      amount: 2000000,
      description: "Đóng bảo hiểm tháng 2 cho Hường và Cún"
    },
  ]
)
puts "========== Created #{entries.count} Entries =========="

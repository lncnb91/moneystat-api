# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
  [
    {
      name: "Ngọc Cường"
    },
    {
      name: "Thu Hường"
    }
  ]
)

categories = Category.create(
  [
    {
      is_expense: true,
      name: "Bank debt",
      description: "Tiền trả lãi và gốc vay ngân hàng hàng tháng"
    },
    {
      is_expense: true,
      name: "House Bills",
      description: "Tiền điện, nước, ga, gửi xe, quản lý chung cư, phí internet..."
    },
    {
      is_expense: true,
      name: "Food & Drink",
      description: "Tiền ăn sáng, ăn trưa, mua thức ăn"
    },
    {
      is_expense: true,
      name: "Shopping",
      description: "Tiền mua đồ dùng"
    },
    {
      is_expense: true,
      name: "Family",
      description: "Tiền biếu người thân, quà tặng cho người thân"
    },
    {
      is_expense: true,
      name: "Children & Baby",
      description: "Tiền chi phí các khoản cho em bé"
    },
    {
      is_expense: true,
      name: "Health & Fitness",
      description: "Tiền viện phí, khám bệnh, mua thuốc, phí tập thể hình, làm đẹp, cắt tóc..."
    },
    {
      is_expense: true,
      name: "Transportation",
      description: "Tiền đi taxi, đi xe khách, tiền sửa xe, rửa xe..."
    },
    {
      is_expense: true,
      name: "Gift",
      description: "Tiền quà tặng, tiền mừng cưới, ma chay..."
    },
    {
      is_expense: true,
      name: "Entertainment",
      description: "Tiền đi chơi, đi du lịch"
    },
    {
      is_expense: true,
      name: "Education",
      description: "Tiền mua sách vở, đăng ký khoá học"
    },
    {
      is_expense: true,
      name: "Insurances",
      description: "Tiền bảo hiểm"
    },
    {
      is_expense: true,
      name: "Other expense",
      description: "Các loại tiền khác"
    },
    {
      is_expense: false,
      name: "Salary",
      description: "Tiền lương"
    },
    {
      is_expense: false,
      name: "Partime",
      description: "Tiền lương làm ngoài"
    },
    {
      is_expense: false,
      name: "Other income",
      description: "Tiền được cho tặng..."
    }
  ]
)

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

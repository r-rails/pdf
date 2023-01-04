class Charge < ApplicationRecord
  belongs_to :partner

  def receipt
    Receipts::Receipt.new(
      details: [
        ["Receipt Number", "123"],
        ["Date paid", Date.today],
        ["Payment method", "ACH super long super long super long super long super long"]
        ],
        company: {
          name: "Example, LLC",
          address: "123 Fake Street\nNew York City, NY 10012",
          email: "support@example.com",
          logo: File.expand_path("./examples/images/logo.png")
        },
        recipient: [
          "Customer",
          "Their Address",
          "City, State Zipcode",
          nil,
          "customer@example.org"
        ],
        line_items: [
          ["<b>Item</b>", "<b>Unit Cost</b>", "<b>Quantity</b>", "<b>Amount</b>"],
          ["Subscription", "$19.00", "1", "$19.00"],
          [nil, nil, "Subtotal", "$19.00"],
          [nil, nil, "Tax", "$1.12"],
          [nil, nil, "Total", "$20.12"],
          [nil, nil, "<b>Amount paid</b>", "$20.12"],
          [nil, nil, "Refunded on #{Date.today}", "$5.00"]
        ],
        footer: "Thanks for your business. Please contact us if you have any questions."
      )
  end
end

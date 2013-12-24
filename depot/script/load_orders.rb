order.transaction do
  (1..100).each do |i|
    Order.create(name: "Customer #{i}", address: "#{i} Main Street", email: "customer-#{i}@varsha@gmail.com", pay_type: "Cheque" )
  end
end
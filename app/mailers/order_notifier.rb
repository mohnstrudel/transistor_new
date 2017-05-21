class OrderNotifier < ApplicationMailer

  default from: 'order@transistor.eve-trader.net'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    @greeting = "Hi"

    mail to: @order.email, subject: 'Ваш заказ в магазине Транзистор'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @greeting = "Hi"


    mail to: "to@example.org"
  end

  def shop_notify(order)
    @order = order
    @delivery = Delivery.find(@order.delivery_id)

    mail to: Setting.first.mail, subject: 'Новый заказ в магазине Транзистор'
  end
end

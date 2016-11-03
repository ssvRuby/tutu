class TicketMailer < ApplicationMailer
  def buy_ticket(ticket)
    @ticket = ticket
    @user = ticket.user
    mail(to: @user.email, subject: "Информация о билете")
  end

  def cancel_ticket(ticket)
    @user = ticket.user
    @ticket = ticket
    mail(to: @user.email, subject: "Отмена билета")
  end
end

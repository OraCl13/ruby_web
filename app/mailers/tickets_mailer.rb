class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'You bought ticket')
  end

  def delete_ticket(user)
    @user = user
    mail(to: user.email, subject: 'You delete ticket')
  end
end

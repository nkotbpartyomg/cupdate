class CustomerMailer < ActionMailer::Base
  default from: "cupdater@gmail.com"

  def welcome_email(artist)
    @artist = artist
    mail(to: @artist.email, subject: 'Welcome to Cupdate')
  end

  def update_email(artist, item)
    @artist = artist
    @item = item
    mail(to: @item.customer_email, subject: 'Cupdate: Progress has been made on your item')
  end


end

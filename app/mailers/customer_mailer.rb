class CustomerMailer < ActionMailer::Base
  default from: '"Cupdate" <cupdater@gmail.com>'

  def welcome_email(artist)
    @artist = artist
    mail(to: @artist.email, subject: 'Welcome to Cupdate')
  end

  def update_email(artist, item)
    @artist = artist
    @item = item
    mail(to: @item.customer_email, cc: @artist.email, subject: 'Cupdate: Progress has been made on your product')
  end


end

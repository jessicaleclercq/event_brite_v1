class UserMailer < ApplicationMailer
  default from: 'jessica_leclercq@hotmail.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://events-round-the-hood.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Holy guacamole!') 
  end

  def participation_email(attendance)
    @admin = User.find(attendance.event.admin_id)
    @event = Event.find(attendance.event.id)
    @participant = User.find(attendance.user.id)
    mail(to: @admin.email, subject: 'Nouveau participant')    
  end
  
end

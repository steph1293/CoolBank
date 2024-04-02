from pydoc import render_doc
from django.contrib.auth.views import LoginView
from django.views.generic import TemplateView
from django.urls import reverse_lazy
from django.contrib.auth.models import User
from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.contrib.auth import authenticate, login
from django.http import HttpRequest

class CustomLoginView(LoginView):
    template_name = "login-custom.html"
    #redirect_authenticated_user = True
class CustomWelcomeView(TemplateView):
    template_name = "welcome.html"
    
def signin(request):

             if request.method == "POST":
                username = request.POST['username']
                password = request.POSR['password']
                
                user = authenticate(username=username, password=password)
                
                if user is not None:
                    login(request, user)
                    fname = user.get_username
                    return render(request, CustomWelcomeView, {'username': fname})

                else:
                    return redirect(CustomLoginView)
                
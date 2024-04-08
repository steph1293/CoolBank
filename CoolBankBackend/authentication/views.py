from django.shortcuts import redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.views import LoginView
from django.views.generic import TemplateView
from django.contrib.auth import authenticate, login
from django.contrib import messages


from django.contrib.auth.views import LoginView
from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.contrib import messages
from django.http import HttpResponseRedirect


class CustomLoginView(LoginView):
    template_name = "login-custom.html"
    redirect_authenticated_user = False
    success_url = reverse_lazy("welcome")

    def form_valid(self, form):
        messages.success(self.request, "Login successful.")
        return super().form_valid(form)

    def form_invalid(self, form):
        messages.error(self.request, "Invalid username or password.")
        return HttpResponseRedirect(self.request.path_info)


class CustomWelcomeView(TemplateView):
    template_name = "welcome.html"

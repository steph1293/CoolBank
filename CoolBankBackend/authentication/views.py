from django.contrib.auth.views import LoginView
from django.urls import reverse_lazy


class CustomLoginView(LoginView):
    template_name = "login-custom.html"
    redirect_authenticated_user = True
    next_page = reverse_lazy("home")  # Assuming you have a home page named 'home'

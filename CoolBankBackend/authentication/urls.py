from django.urls import path
from .views import CustomLoginView
from .views import CustomWelcomeView

urlpatterns = [
    path("login/", CustomLoginView.as_view(), name="login"),   
    path("welcome/", CustomWelcomeView.as_view(), name="welcome")

]

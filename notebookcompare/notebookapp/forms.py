from django.forms import ModelForm
from notebookapp.models import *

class ReviewForm(ModelForm):
    class Meta:
        model = Review
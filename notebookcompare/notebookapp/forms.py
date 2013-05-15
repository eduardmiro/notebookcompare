from django.forms import ModelForm
from notebookapp.models import *

class ReviewForm(ModelForm):
    def __init__(self, user,model_id, *args, **kwargs):
        super(ReviewForm, self).__init__(*args, **kwargs)
	self.fields['user'].empty_label = None
	self.fields['user'].queryset = User.objects.filter(pk=user.pk)
	self.fields['model'].empty_label = None
	self.fields['model'].queryset = Model.objects.filter(pk=model_id)
    class Meta:
        model = Review
	




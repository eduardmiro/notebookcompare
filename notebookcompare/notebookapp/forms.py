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
	


class AddModel(ModelForm):
    def __init__(self, user, *args, **kwargs):
        super(AddModel, self).__init__(*args, **kwargs)
	self.fields['useradd'].empty_label = None
	self.fields['useradd'].queryset = User.objects.filter(pk=user.pk)
    class Meta:
        model = Model

class AddComponent(ModelForm):
    def __init__(self, user, *args, **kwargs):
        super(AddComponent, self).__init__(*args, **kwargs)
    class Meta:
        model = Component

class AddSpecification(ModelForm):
    def __init__(self, user, *args, **kwargs):
        super(AddSpecification, self).__init__(*args, **kwargs)
    class Meta:
        model = Specification

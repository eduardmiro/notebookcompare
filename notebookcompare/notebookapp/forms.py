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
    
class ReviewFormEdit(ModelForm):
    class Meta:
        model = Review
	exclude = ('model','user')

class AddModel(ModelForm):
    def __init__(self, user, *args, **kwargs):
        super(AddModel, self).__init__(*args, **kwargs)
        self.fields['user'].empty_label = None
        self.fields['user'].queryset = User.objects.filter(pk=user.pk)
        self.fields['user'].label = "Added by:"
    class Meta:
        model = Model
class ModelFormEdit(ModelForm):
    class Meta:
        model = Model
	exclude = ('user')

class AddComponent(ModelForm):
    def __init__(self, user, *args, **kwargs):
        super(AddComponent, self).__init__(*args, **kwargs)
        self.fields['user'].empty_label = None
        self.fields['user'].queryset = User.objects.filter(pk=user.pk)
        self.fields['user'].label = "Added by:"
    class Meta:
        model = Component
class EditComponent(ModelForm):
    class Meta:
        model = Component
	exclude = ('user')

class AddSpecification(ModelForm):
    def __init__(self, user, *args, **kwargs):
        super(AddSpecification, self).__init__(*args, **kwargs)
        self.fields['user'].empty_label = None
        self.fields['user'].queryset = User.objects.filter(pk=user.pk)
        self.fields['user'].label = "Added by:"
    class Meta:
        model = Specification

class EditSpecification(ModelForm):
    class Meta:
        model = Specification
	exclude = ('user')

class AddBrand(ModelForm):
    def __init__(self, user, *args, **kwargs):
        super(AddBrand, self).__init__(*args, **kwargs)
        self.fields['user'].empty_label = None
        self.fields['user'].queryset = User.objects.filter(pk=user.pk)
        self.fields['user'].label = "Added by:"
    class Meta:
        model = Brand

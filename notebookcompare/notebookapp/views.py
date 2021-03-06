# Create your views here.
from django.http import HttpResponse
from django.template import RequestContext
from django.template.loader import get_template
from django.shortcuts import render_to_response
from django.contrib.auth import authenticate, login , logout
from django.views.decorators.csrf import csrf_protect
from django.shortcuts import render
from django import forms
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
from django.views.generic.edit import UpdateView
# imports 
from forms import *
from notebookapp.models import *
from django.http import Http404
from django.db.models import Avg

from rest_framework import generics, permissions
from serializers import BrandSerializer, ComponentSerializer, SpecificationSerializer, ModelSerializer

# 
def mainpage(request):
	param = { 'titlehead' : "Home"}
	return render_to_response('mainpage.html', param, context_instance=RequestContext(request))

# login part, we use the bult-in for login but we need the logout because we want to use some extra parameters. note that we have to use context_instance=RequestContext(request)  for parsing the user in every def in views.py
def logout_view(request):
    logout(request)
    param = { 'titlehead' : "Log out",
	      'state': "Thanks for use Notebookcompare, Feel free to come back when you want!"}
    return render_to_response('mainpage.html', param)
# register user part
def register(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            new_user = form.save()
            return HttpResponseRedirect("/")
    else:
        form = UserCreationForm()
    return render(request, "registration/register.html", {
        'form': form,
    })

@login_required
def userpanel(request):
	param = { 'titlehead' : "User Panel"}
	return render_to_response('userpanel.html', param, context_instance=RequestContext(request))


# lists all the brands in the DB
def brands(request):
	param = { 'titlehead' : "List of all Brands"}
	param['all_brands'] = Brand.objects.all()
	return render_to_response('brands/brands.html', param, context_instance=RequestContext(request))


# Shows the details of one brand , we retrieve the details and we show it on detailbrand
def brand_detail(request, brand_name):
	try:
		brand = Brand.objects.get(name=brand_name)
		param = { 'titlehead' : "Brand Details",
			  'name' : brand.name ,
                          'web' : brand.web ,
			  'country' : brand.country ,
			  'pictureurl' : brand.pictureurl}
	except:
       	 raise Http404
    	return render_to_response('brands/detailbrand.html', param, context_instance=RequestContext(request))

# lists all the models avaibles and we order it by the brand name
def models(request):
	param = { 'titlehead' : "List of all Models ordered by Brand"}
	param['all_models'] = Model.objects.all().order_by('brand')
	return render_to_response('models/models.html', param, context_instance=RequestContext(request))

# Shows the details of a Model, we try if the model exist and give all the details, if not we show a 404 error.
# as "spec" is many to many we have to get it on diferent variable.
def model_detail(request, pk):
	try:
		
   		
		model = Model.objects.get(pk=pk)
		review = Review.objects.filter(model=model.pk)
		reviewrating = Review.objects.filter(model=model.pk).aggregate(Avg('rating'))
		specs = model.specification.all()
		param = { 'titlehead' : "Model Details - "+ model.name,
			  'id' : model.pk,
			  'name' : model.name ,
			  'date' : model.date ,
		          'user' : model.user,
                          'price' : model.price ,
			  'brand' : model.brand,
			  'spec':specs,
                          'pictureurl' : model.pictureurl,
			  'review' : review,
			  'reviewrating' : reviewrating,
			  'RATING_CHOICES' : Review.RATING_CHOICES }

	except:
       	 raise Http404
    	return render_to_response('models/detailmodel.html', param, context_instance=RequestContext(request))

# show all the models of a specific brand
def brand_models(request, brand_name):
	try:
		brand = Brand.objects.get(name=brand_name)
		param = { 'titlehead' : "Brand Details - Show all models",
			  'brandname' : brand.name ,
                          'brandweb' : brand.web ,
			  'brandcountry' : brand.country ,
			  'brandpictureurl' : brand.pictureurl}
		# Filter the info, only the brand selected.
		query = Model.objects.filter(brand=brand.pk)
		param['all_models_brand'] = query

	except:
       	 raise Http404
    	return render_to_response('brands/detailbrandmodel.html', param, context_instance=RequestContext(request))

# list all components on the database, on this we want to show CPU, GFX...
def components(request):
	param = { 'titlehead' : "List of all components"}
	param['all_components'] = Component.objects.all().order_by('name')
	return render_to_response('components/components.html', param, context_instance=RequestContext(request))
# list all components details , in this we want to show all the different types of a component (for example all the cpus that have the different computers)
def component_detail(request, pk):
	try:
		query = Specification.objects.filter(component=pk)
		param = { 'titlehead' : "List of Specification",
			  'spec':query	}
		
	except:
       	 raise Http404
    	return render_to_response('components/detailcomponent.html', param, context_instance=RequestContext(request))

# Lists all the different specifications , so here we show all the differents component specifications that we have (all the cpu's, all the gfx...)
def specifications_detail_all(request):
	try:
		query = Specification.objects.all()
		param = { 'titlehead' : "List of all components details ",
			  'spec':query	}
		
	except:
       	 raise Http404
    	return render_to_response('specifications/detailspecifications.html', param, context_instance=RequestContext(request))

# All computers regarding a specific spec
def specifications_list(request, spec_id):
	try:

		query = Model.objects.filter(specification=spec_id)
		param = { 'titlehead' : "Search a model with specific specification",
			  'spec':query}
			  
# here we raise the http error if we do not pass the component id (for example AA instead of a number), if it's a number we control the error in the html 
	except:
       	 raise Http404
    	return render_to_response('specifications/listmodelsspec.html', param, context_instance=RequestContext(request))


def review(request):
	try:
		query = Review.objects.all()
		param = { 'titlehead' : "List of all reviews ",
			  'review' : query	}
		
	except:
       	 raise Http404
    	return render_to_response('review/review_list.html', param, context_instance=RequestContext(request))

@login_required
def review_model_add(request, model_id):
    query = Model.objects.filter(pk=model_id)
    user = request.user
    if request.method == 'POST':  # If the form has been submitted...
        form = ReviewForm(user, model_id, request.POST)  # A form bound to the POST data
        if form.is_valid():  # All validation rules pass
            form.save()
            return HttpResponseRedirect('/models/view/' + model_id)  # Redirect after POST
    else:
        form = ReviewForm(user, model_id)  # An unbound form
    param = { 'titlehead' : "Formulari Review",
			  'model': query,
			  'model_id' : model_id,
			  'form':form	}
    return render(request, 'review/review_add.html', param , context_instance=RequestContext(request))

def review_model_view(request, model_id):

	try:
		query = Review.objects.filter(model=model_id)
		param = { 'titlehead' : "List of review of a model ",
			  'review' : query	}
		
	except:
       	 raise Http404
    	return render_to_response('review/review_list.html', param, context_instance=RequestContext(request))

def review_view(request, review_id):

	try:
		query = Review.objects.filter(pk=review_id)
		param = { 'titlehead' : "View a review ",
			  'review' : query	}
		
	except:
       	 raise Http404
    	return render_to_response('review/review_view.html', param, context_instance=RequestContext(request))



@login_required
def model_add(request):
    user = request.user
    if request.method == 'POST':  # If the form has been submitted...
        form = AddModel(user, request.POST)  # A form bound to the POST data
        if form.is_valid():  # All validation rules pass
            form.save()
            return HttpResponseRedirect('/models/')  # Redirect after POST
    else:
        form = AddModel(user)  # An unbound form
    param = { 'titlehead' : "Add Notebook Form",
			  'form':form	}
    return render(request, 'add_form.html', param , context_instance=RequestContext(request))



@login_required
def components_add(request):
	user = request.user
	if request.method == 'POST':  # If the form has been submitted...
		form = AddComponent(user,request.POST)  # A form bound to the POST data
		if form.is_valid():  # All validation rules pass
			form.save()
			return HttpResponseRedirect('/components/')  # Redirect after POST
	else:
		form = AddComponent(user)  # An unbound form
	param = { 'titlehead' : "Add component Form", 'form':form	}
	return render(request, 'add_form.html', param , context_instance=RequestContext(request))

@login_required
def specifications_add(request):
    user = request.user
    if request.method == 'POST':  # If the form has been submitted...
        form = AddSpecification(user,request.POST)  # A form bound to the POST data
        if form.is_valid():  # All validation rules pass
            form.save()
            return HttpResponseRedirect('/specifications/')  # Redirect after POST
    else:
        form = AddSpecification(user)  # An unbound form
    param = { 'titlehead' : "Add Specification Form",
			  'form':form	}
    return render(request, 'add_form.html', param , context_instance=RequestContext(request))


@login_required
def brands_add(request):
    user = request.user
    if request.method == 'POST':  # If the form has been submitted...
        form = AddBrand(user, request.POST)  # A form bound to the POST data
        if form.is_valid():  # All validation rules pass
            form.save()
            return HttpResponseRedirect('/brands/')  # Redirect after POST
    else:
        form = AddBrand(user)  # An unbound form
    param = { 'titlehead' : "Add Brand Form",
			  'form':form	}
    return render(request, 'brands/add_form.html', param , context_instance=RequestContext(request))
@login_required
def myreviews(request):
	try:	
		user = request.user
		query = Review.objects.filter(user=user)
		param = { 'titlehead' : "Your Reviews ",
			  'review' : query	}
		
	except:
       	 raise Http404
    	return render_to_response('userpanel/myreviews.html', param, context_instance=RequestContext(request))

@login_required
def mylaptops(request):
	try:	
		user = request.user
		param = { 'titlehead' : "Your Laptops",
			  	}
		query = Model.objects.filter(user=user.pk)
		param['all_models'] = query
		print param
		
	except:
       	 raise Http404
    	return render_to_response('userpanel/mylaptops.html', param, context_instance=RequestContext(request))

# Delete Functions
@login_required
def review_delete(request, pk):
    review = Review.objects.get(pk=pk)
    
    param = { 'titlehead' : "ERROR",
	      'state': "You have no permission to delete this review"}
    param2 = { 'titlehead' : "Success",
	      'state': "Review deleted!"}
    user = request.user

    if review.user.pk != user.pk:
        return render_to_response('mainpage.html', param, context_instance=RequestContext(request))
    review.delete()
    return render_to_response('mainpage.html', param2, context_instance=RequestContext(request))

@login_required
def models_delete(request, pk):
    model = Model.objects.get(pk=pk)
    
    param = { 'titlehead' : "ERROR",
	      'state': "You have no permission to delete this Model"}
    param2 = { 'titlehead' : "Success",
	      'state': "Model deleted!"}
    user = request.user

    if model.user.pk != user.pk:
        return render_to_response('mainpage.html', param, context_instance=RequestContext(request))
    model.delete()
    return render_to_response('mainpage.html', param2, context_instance=RequestContext(request))


### RESTful API views ###
class IsOwnerOrReadOnly(permissions.BasePermission):

    def has_object_permission(self, request, view, obj):
        # Read permissions are allowed to any request,
        # so we'll always allow GET, HEAD or OPTIONS requests.
        if request.method in permissions.SAFE_METHODS:
            return True

        # Instance must have an attribute named `owner`.
        return obj.user == request.user


class APIBrandList(generics.ListCreateAPIView):
    permission_classes = (IsOwnerOrReadOnly,)
    model = Brand
    serializer_class = BrandSerializer

class APIBrandDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IsOwnerOrReadOnly,)
    model = Brand
    serializer_class = BrandSerializer

class APIModelList(generics.ListCreateAPIView):
    permission_classes = (IsOwnerOrReadOnly,)
    model = Model
    serializer_class = ModelSerializer

class APIModelDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IsOwnerOrReadOnly,)
    model = Model
    serializer_class = ModelSerializer

class APIComponentList(generics.ListCreateAPIView):
    permission_classes = (IsOwnerOrReadOnly,)
    model = Component
    serializer_class = ComponentSerializer

class APIComponentDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IsOwnerOrReadOnly,)
    model = Component
    serializer_class = ComponentSerializer

class APISpecificationList(generics.ListCreateAPIView):
    permission_classes = (IsOwnerOrReadOnly,)
    model = Specification
    serializer_class = SpecificationSerializer

class APISpecificationDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IsOwnerOrReadOnly,)
    model = Specification
    serializer_class = SpecificationSerializer
    

# Create your views here.
from django.http import HttpResponse
from django.template import RequestContext
from django.template.loader import get_template
from django.shortcuts import render_to_response
from django.contrib.auth import authenticate, login , logout
from django.views.decorators.csrf import csrf_protect


#imports 
from notebookapp.models import Brand
from notebookapp.models import Model
from notebookapp.models import *
from django.http import Http404
# 
def mainpage(request):
	param = { 'titlehead' : "Home"}
	return render_to_response('mainpage.html',param,context_instance=RequestContext(request))

#lists all the brands in the DB
def brands(request):
	param = { 'titlehead' : "List of all Brands"}
	param['all_brands'] = Brand.objects.all()
	return render_to_response('brands.html',param)


#Shows the details of a brand
def brand_detail(request, brand_name):
	try:
		brand= Brand.objects.get(name=brand_name)
		param = { 'titlehead' : "Brand Details",
			  'name' : brand.name ,
                          'web' : brand.web ,
			  'country' : brand.country , 
			  'pictureurl' : brand.pictureurl}
	except Brand.DoesNotExist:
       	 raise Http404
    	return render_to_response('detailbrand.html', param)

#lists all the models
def models(request):
	param = { 'titlehead' : "List of all Models ordered by Brand"}
	param['all_models'] = Model.objects.all().order_by('brand')
	return render_to_response('models.html',param)

#Shows the details of a Model
def model_detail(request, model_name):
	try:
		
   		
		model= Model.objects.get(name=model_name)
		specs = model.specification.all()
		param = { 'titlehead' : "Model Details",
			  'name' : model.name ,
			  'date' : model.date , 
                          'price' : model.price ,
			  'brand' : model.brand,
			  'spec':specs,
                          'pictureurl' : model.pictureurl }

	except Model.DoesNotExist:
       	 raise Http404
    	return render_to_response('detailmodel.html', param)

#show all the models of a brand
def brand_models(request, brand_name):
	try:
		brand= Brand.objects.get(name=brand_name)
		param = { 'titlehead' : "Brand Details - Show all models",
			  'brandname' : brand.name ,
                          'brandweb' : brand.web ,
			  'brandcountry' : brand.country , 
			  'brandpictureurl' : brand.pictureurl}
		#Filter the info, only the brand selected.
		query = Model.objects.filter(brand=brand.pk)
		param['all_models_brand'] = query

	except Brand.DoesNotExist:
       	 raise Http404
    	return render_to_response('detailbrandmodel.html', param )

#list all components
def components(request):
	param = { 'titlehead' : "List of all components"}
	param['all_components'] = Component.objects.all().order_by('name')
	return render_to_response('components.html',param)
#list all components detail
def component_detail(request, comp_name):
	try:
		spec= Component.objects.get(name=comp_name)
		query = Specification.objects.filter(component=spec.pk)

		param = { 'titlehead' : "List of all "+  comp_name,
			  'spec':query	}
		
	except Brand.DoesNotExist:
       	 raise Http404
    	return render_to_response('detailcomponent.html', param)

#Specifications list ALL details
def specifications_detail_all(request):
	try:
		query = Specification.objects.all()
		param = { 'titlehead' : "List of all components details ",
			  'spec':query	}
		
	except Brand.DoesNotExist:
       	 raise Http404
    	return render_to_response('detailspecifications.html', param)

#All computers regarding a specific spec
def specifications_list(request, spec_id):
	try:

		query = Model.objects.filter(specification=spec_id)
		param = { 'titlehead' : "Search a model with specific specification",
			  'spec':query}
			  
		
	except Brand.DoesNotExist:
       	 raise Http404
    	return render_to_response('listmodelsspec.html', param)
#login  ,context_instance=RequestContext(request) is for parsing the user

def login_user(request):
    state = "Please log in below..."
    username = password = ''
    if request.POST:
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                state = "You're successfully logged in!"
            else:
                state = "Your account is not active, please contact the site admin."
        else:
            state = "Your username and/or password were incorrect."

    return render_to_response('login.html',{'state':state, 'username': username },context_instance=RequestContext(request))
def logout_user(request):
    logout(request)
    param = { 'titlehead' : "Home"}
    return render_to_response('mainpage.html',param)



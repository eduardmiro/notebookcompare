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


#imports 
from forms import *
from notebookapp.models import Brand
from notebookapp.models import Model
from notebookapp.models import *
from django.http import Http404
# 
def mainpage(request):
	param = { 'titlehead' : "Home"}
	return render_to_response('mainpage.html',param,context_instance=RequestContext(request))

#login part, we use the bult-in for login but we need the logout because we want to use some extra parameters. note that we have to use context_instance=RequestContext(request)  for parsing the user in every def in views.py
def logout_view(request):
    logout(request)
    param = { 'titlehead' : "Log out",
	      'state': "Thanks for use Notebookcompare, Feel free to come back when you want!"}
    return render_to_response('mainpage.html',param)


#lists all the brands in the DB
def brands(request):
	param = { 'titlehead' : "List of all Brands"}
	param['all_brands'] = Brand.objects.all()
	return render_to_response('brands.html',param,context_instance=RequestContext(request))


#Shows the details of one brand , we retrieve the details and we show it on detailbrand
def brand_detail(request, brand_name):
	try:
		brand= Brand.objects.get(name=brand_name)
		param = { 'titlehead' : "Brand Details",
			  'name' : brand.name ,
                          'web' : brand.web ,
			  'country' : brand.country , 
			  'pictureurl' : brand.pictureurl}
	except:
       	 raise Http404
    	return render_to_response('detailbrand.html',param,context_instance=RequestContext(request))

#lists all the models avaibles and we order it by the brand name
def models(request):
	param = { 'titlehead' : "List of all Models ordered by Brand"}
	param['all_models'] = Model.objects.all().order_by('brand')
	return render_to_response('models.html',param,context_instance=RequestContext(request))

#Shows the details of a Model, we try if the model exist and give all the details, if not we show a 404 error.
#as "spec" is many to many we have to get it on diferent variable.
def model_detail(request, model_name):
	try:
		
   		
		model= Model.objects.get(name=model_name)
		review = Review.objects.filter(model=model.pk)
		specs = model.specification.all()
		param = { 'titlehead' : "Model Details",
			  'name' : model.name ,
			  'date' : model.date , 
                          'price' : model.price ,
			  'brand' : model.brand,
			  'spec':specs,
                          'pictureurl' : model.pictureurl,
			  'review' : review }

	except:
       	 raise Http404
    	return render_to_response('detailmodel.html',param,context_instance=RequestContext(request))

#show all the models of a specific brand
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

	except:
       	 raise Http404
    	return render_to_response('detailbrandmodel.html',param,context_instance=RequestContext(request))

#list all components on the database, on this we want to show CPU, GFX...
def components(request):
	param = { 'titlehead' : "List of all components"}
	param['all_components'] = Component.objects.all().order_by('name')
	return render_to_response('components.html',param,context_instance=RequestContext(request))
#list all components details , in this we want to show all the different types of a component (for example all the cpus that have the different computers)
def component_detail(request, comp_name):
	try:
		spec= Component.objects.get(name=comp_name)
		query = Specification.objects.filter(component=spec.pk)

		param = { 'titlehead' : "List of all "+  comp_name,
			  'spec':query	}
		
	except:
       	 raise Http404
    	return render_to_response('detailcomponent.html',param,context_instance=RequestContext(request))

#Lists all the different specifications , so here we show all the differents component specifications that we have (all the cpu's, all the gfx...)
def specifications_detail_all(request):
	try:
		query = Specification.objects.all()
		param = { 'titlehead' : "List of all components details ",
			  'spec':query	}
		
	except:
       	 raise Http404
    	return render_to_response('detailspecifications.html',param,context_instance=RequestContext(request))

#All computers regarding a specific spec
def specifications_list(request, spec_id):
	try:

		query = Model.objects.filter(specification=spec_id)
		param = { 'titlehead' : "Search a model with specific specification",
			  'spec':query}
			  
#here we raise the http error if we do not pass the component id (for example AA instead of a number), if it's a number we control the error in the html 
	except:
       	 raise Http404
    	return render_to_response('listmodelsspec.html',param,context_instance=RequestContext(request))


def review(request):
    if request.method == 'POST': # If the form has been submitted...
        form = ReviewForm(request.POST) # A form bound to the POST data
	#form = ConcursantForm.base_fields['escola'].queryset = Escola.objects.filter(responsables="1")
        if form.is_valid(): # All validation rules pass
            form.save()
            return HttpResponseRedirect('/') # Redirect after POST
    else:
        form = ReviewForm() # An unbound form
    param = { 'titlehead' : "Formulari Inscripcio",
			  'form':form	}
    return render(request, 'review.html', param ,context_instance=RequestContext(request))








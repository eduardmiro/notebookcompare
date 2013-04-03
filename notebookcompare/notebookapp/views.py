# Create your views here.
from django.http import HttpResponse
from django.template import Context
from django.template.loader import get_template
from django.shortcuts import render_to_response

#imports 
from notebookapp.models import Brand
from notebookapp.models import Model
from notebookapp.models import *
from django.http import Http404
# 
def mainpage(request):
	param = { 'titlehead' : "Home"}
	return render_to_response('mainpage.html',param)

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







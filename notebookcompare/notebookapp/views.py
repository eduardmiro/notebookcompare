# Create your views here.
from django.http import HttpResponse
from django.template import Context
from django.template.loader import get_template
from notebookapp.models import Brand
from django.shortcuts import render_to_response

from django.http import Http404
# 
def mainpage(request):
	param = { 'titlehead' : "Home"}
	return render_to_response('mainpage.html',param)

#lists all the brands in the DB
def brands(request):
	param = { 'titlehead' : "List of all Brands"}
	param['all_brands'] = Brand.objects.all()
	#output = ', '.join([p.name + ' '+ p.web for p in all_brands])
	#return HttpResponse(output)
	return render_to_response('brands.html',param)


#list the details of a brand
def brand_detail(request, brand_name):
	try:
		brand= Brand.objects.get(name=brand_name)
		param = {'titlehead' : "Brand Details",'name' : brand.name ,'web' : brand.web , 'country' : brand.country}
	except Brand.DoesNotExist:
       	 raise Http404
    	return render_to_response('detailbrand.html', param)








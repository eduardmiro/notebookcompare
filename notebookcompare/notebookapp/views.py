# Create your views here.
from django.http import HttpResponse
from django.template import Context
from django.template.loader import get_template
from notebookapp.models import Brand
from django.shortcuts import render_to_response

from django.http import Http404
# 
def mainpage(request):
	return render_to_response('mainpage.html')

#lists all the brands in the DB
def brands(request):
	all_brands = Brand.objects.all()
	output = ', '.join([p.name + ' '+ p.web for p in all_brands])
	#return HttpResponse(output)
	return render_to_response('brands.html')
#list the details of a brand
def brand_detail(request, brand_name):
	try:
		b = Brand.objects.get(name=brand_name)
	except Brand.DoesNotExist:
       	 raise Http404
    	return render_to_response('detailbrand.html', {'brand': b},
				context_instance=RequestContext(request))








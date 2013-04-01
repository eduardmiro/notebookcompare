# Create your views here.
from django.http import HttpResponse
from django.template import Context
from django.template.loader import get_template
# 
def mainpage(request):
	template = get_template('mainpage.html')
	variables = Context({
                      'titlehead': 'Notebook Compare application',
                      'pagetitle': 'Benvinguts a la nostra aplicacio per comparar portatils!',
                      'contentbody': ''
	})
	output = template.render(variables)
	return HttpResponse(output)

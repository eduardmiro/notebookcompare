from rest_framework.fields import *
from rest_framework.relations import HyperlinkedRelatedField, HyperlinkedIdentityField
from rest_framework.serializers import HyperlinkedModelSerializer
from models import Brand, Model, Component, Specification

class BrandSerializer(HyperlinkedModelSerializer):
    url = HyperlinkedIdentityField(view_name='brand-detail')
    user = CharField(read_only=True)
    class Meta:
        model = Brand
        fields = ('url', 'name', 'country', 'web', 'pictureurl', 'user')
        
class ComponentSerializer(HyperlinkedModelSerializer):
    url = HyperlinkedIdentityField(view_name='component-detail')
    user = CharField(read_only=True)
    class Meta:
        model = Component
        fields = ('url', 'name', 'user')
        
class SpecificationSerializer(HyperlinkedModelSerializer):
    url = HyperlinkedIdentityField(view_name='specification-detail')
    user = CharField(read_only=True)
    class Meta:
        model = Specification
        fields = ('url', 'name', 'component', 'user')

class ModelSerializer(HyperlinkedModelSerializer):
    url = HyperlinkedIdentityField(view_name='model-detail')
    brand = HyperlinkedRelatedField(view_name='brand-detail')
    date = DateField(format='date' ,input_formats='DD-MM-YYYY')
    user = CharField(read_only=True)
    class Meta:
        model = Model
        fields = ('url', 'brand', 'name', 'date', 'price', 'specification', 'pictureurl', 'user')
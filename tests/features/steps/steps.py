# -*- coding: UTF-8 -*-  
from behave_db.steps import *
from behave import step
from behave_db.utils import db_config_vars


#Expansion behave_db's setps
@step(u'the "{result}" value should be "{value}"')
@db_config_vars
def result_should_be_value(context, result, value):
    assert result, u'The result is null'
    result_value = result[0][0]
    assert result_value == int(value), str(result_value) + u'!=' + str(value)


# -*- coding: UTF-8 -*-  
import os
from behave_db import environment as benv


def before_all(context):
    import behave_db
    config_datas = {}
    #find data_dir
    data_dir = os.path.join(
        os.path.dirname(behave_db.__file__), "../../tests/data"
    )
    #set csv-jdbc-config
    config_datas['driver_name'] = "org.relique.jdbc.csv.CsvDriver"
    config_datas['driver_jar_path'] = os.path.join(data_dir,"drivers","csvjdbc-1.0-37.jar")
    config_datas['csv_jdbc_url'] = "jdbc:relique:csv:" + data_dir
    #copy var to behave_db
    benv.before_all(context)
    context.db_config = config_datas


def after_scenario(context, scenario):
    # auto close connect
    context.execute_steps(u"""
                 When I close the connect
                """)

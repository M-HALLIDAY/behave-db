import os
from behave_db import environment as benv


def before_all(context):
    import behave_db
    context.data_dir = os.path.join(
        os.path.dirname(behave_db.__file__), "../../tests/data"
    )

    benv.before_all(context)


def after_all(context):
    benv.after_all(context)


def before_feature(context, feature):
    benv.before_feature(context, feature)


def after_feature(context, feature):
    benv.after_feature(context, feature)


def before_scenario(context, scenario):
    benv.before_scenario(context, scenario)


def after_scenario(context, scenario):
    benv.after_scenario(context, scenario)

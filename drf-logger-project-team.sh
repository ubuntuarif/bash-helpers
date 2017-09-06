#!/bin/bash

if [ -f $BASH_HELPER_GIT_FOLDER/drf-logger-project-core.sh ]; then
    . $BASH_HELPER_GIT_FOLDER/drf-logger-project-core.sh
fi;

DRF_LOGGER_INIT_POSTGRES_DB_FILE_PATH="$BASH_TEMP_FOLDER/$DRF_LOGGER_INIT_DB_FILE_NAME"
DRF_LOGGER_INIT_POSTGRES_DB_USER_PASSWORD_FILE_PATH="$BASH_TEMP_FOLDER/$DRF_LOGGER_POSTGRES_USER_PASSWORD_RESET_FILE_NAME"
DRF_LOGGER_INIT_DATA_LOAD_PYTHON_FILE_PATH="$BASH_TEMP_FOLDER/$DRF_LOGGER_INIT_DATA_LOAD_PYTHON_FILE_NAME"

alias ${DRF_LOGGER_PROJECT_NAME_UNDERSCORE}_init_data_load="${DRF_LOGGER_PROJECT_NAME_UNDERSCORE}_ve && ./manage.py shell < $DRF_LOGGER_INIT_DATA_LOAD_PYTHON_FILE_PATH"
alias ${DRF_LOGGER_PROJECT_NAME_UNDERSCORE}_postgres_user_password_reset="postgresPasswordReset $DRF_LOGGER_INIT_POSTGRES_DB_USER_PASSWORD_FILE_PATH"
alias ${DRF_LOGGER_PROJECT_NAME_UNDERSCORE}_psql_reset="djangoPsqlReset $DRF_LOGGER_POSTGRES_USER $DRF_LOGGER_INIT_POSTGRES_DB_FILE_PATH"
alias ${DRF_LOGGER_PROJECT_NAME_UNDERSCORE}_reinitiate="djangoReinitiate \"$DRF_LOGGER_PROJECT_ROOT_FOLDER\" \"$DRF_LOGGER_DJANGO_APP_NAMES\" $DRF_LOGGER_INIT_DATA_LOAD_PYTHON_FILE_PATH \"$DRF_LOGGER_DJANGO_OPERATIONS\""
alias ${DRF_LOGGER_PROJECT_NAME_UNDERSCORE}_reset_clean="djangoResetWithoutMigrationClean $DRF_LOGGER_PROJECT_NAME_UNDERSCORE $DRF_LOGGER_INIT_DATA_LOAD_PYTHON_FILE_PATH"
alias ${DRF_LOGGER_PROJECT_NAME_UNDERSCORE}_start_celery="startCeleryWorkers $DRF_LOGGER_CELERY_PROJECT_NAME $DRF_LOGGER_CELERY_FLOWER_HOST $DRF_LOGGER_CELERY_FLOWER_PORT"

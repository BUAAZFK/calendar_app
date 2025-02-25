## Calendar App

#### Functions:

1、You can manage your daily task list and view them in a calendar, adding task by clicking the white space os certain day and click the task to modify it；

2、You can set up the background every day to record if you successfully insist on something today through clicking the day name;

3、You can choose the day you want to watch through clicking the year and month;

#### How to use:

1、Firstly, you should install the following packages:

  1) `pip install Django==5.1.6`

  2) `pip install mysqlclient==2.2.7`

  3) modify line 80 ~ 90 in './calendar_app/calendar_app/settings.py'

     `DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',  # 使用 PostgreSQL
            'NAME': 'calendar',                    # 数据库名称
            'USER': 'root',                    # 数据库用户名
            'PASSWORD': 'your passwork of mysql',            # 数据库密码
            'HOST': 'localhost',                       # 数据库主机，通常是localhost
            'PORT': '3306',                            # 数据库端口，通常是5432
            'OPTIONS': {
                'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",  # 取消严格模式限制
            }
        }
    }`

    4) create a mysql database named `calendar`

    5) run in cmd under this project `python manage.py runserver`

If you want to add other functions, welcome to share with me!

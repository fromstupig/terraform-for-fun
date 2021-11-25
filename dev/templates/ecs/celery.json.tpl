[
    {
        "name": "${app_name}",
        "image": "${app_image}",
        "cpu": ${fargate_cpu
        },
        "memory": ${fargate_memory
        },
        "networkMode": "awsvpc",
        "command": [
            "celery",
            "-A",
            "prism",
            "worker",
            "--loglevel=INFO",
            "--beat",
            "--scheduler",
            "django_celery_beat.schedulers:DatabaseScheduler",
            "--statedb=celery_working.state"
        ],
        "environment": [
            {
                "name": "AWS_ACCESS_KEY_ID",
                "value": "AKIAZVA2MCU3PJSJ6BH4"
            },
            {
                "name": "AWS_SECRET_ACCESS_KEY",
                "value": "ltAJwQAb1I2AxLRgFlHIznNW2/NSn8//0AkOCof3"
            },
            {
                "name": "AWS_STORAGE_BUCKET_NAME",
                "value": "vio-dev-storage"
            },
            {
                "name": "BASE_HOST",
                "value": "api-dev.prismtechinc.com"
            },
            {
                "name": "CORS_ORIGIN_WHITELIST",
                "value": "http://*, https://*"
            },
            {
                "name": "CSRF_TRUSTED_ORIGINS",
                "value": "http://*, https://*"
            },
            {
                "name": "ENV",
                "value": "PRODUCTION"
            },
            {
                "name": "EXTRA_ALLOWED_HOSTS",
                "value": "*"
            },
            {
                "name": "FCM_SERVER_KEY",
                "value": "AAAAuGO847I:APA91bEdG38Ke58f7XLAVXmXV0AIth8gQrSwW-vDCDOHdb4F9QN_zqM0eW9ZZvhYQFgBGAqsBQMWgIo2RhOZEDrcJ-D9ozp8NGiy-mVnFnSltXEGjAwlUhkn3BRYdNU-ZV9Ubw9jLt5-"
            },
            {
                "name": "FIREBASE_DB_URL",
                "value": "https://vio-stag-f50f0-default-rtdb.firebaseio.com/"
            },
            {
                "name": "GOOGLE_DOMAIN_VERIFICATION_CODE",
                "value": "b55ee064e65212c7"
            },
            {
                "name": "MICROSOFT_OAUTH2_KEY",
                "value": "68ee75fc-4284-4ff6-b96a-d829bb7b21bf"
            },
            {
                "name": "MICROSOFT_REDIRECT_URI",
                "value": "msauth.com.prismtech.prism://auth"
            },
            {
                "name": "POSTGRES_DB",
                "value": "vio"
            },
            {
                "name": "POSTGRES_USER",
                "value": "postgres"
            },
            {
                "name": "POSTGRES_HOST",
                "value": "vio-db-dev.cwo3vdrnog4b.us-east-1.rds.amazonaws.com"
            },
            {
                "name": "POSTGRES_PASSWORD",
                "value": "3AAqBH2whM6TjAFr"
            },
            {
                "name": "RABBITMQ_DEFAULT_PASS",
                "value": "678AHFGjkasf90KO"
            },
            {
                "name": "RABBITMQ_DEFAULT_USER",
                "value": "admin"
            },
            {
                "name": "SECRET_KEY",
                "value": "^%c+#1wu+g(s&_2ybin4_w-r)39i5(%6)0y_d70q2vd4ip9y$%"
            },
            {
                "name": "SENTRY_DSN",
                "value": "https://ba8b041020624f5f9f5d6aee8d893e15@o375921.ingest.sentry.io/5196074"
            },
            {
                "name": "SOCIAL_AUTH_GOOGLE_OAUTH2_KEY",
                "value": "969151141669-ce2lvd2jjfuiuga3rfpm51u17gqlth2a.apps.googleusercontent.com"
            },
            {
                "name": "SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET",
                "value": "kbWWpsorJSshK4rp4WFA6vJ9"
            },
            {
                "name": "STRIPE_API_VERSION",
                "value": "2020-03-02"
            },
            {
                "name": "STRIPE_PUBLISHABLE_KEY",
                "value": "pk_test_51GrmhoDWiwaOszRRUVFDXgyNu7fACDgHiu519wwEQ0Dimq5ucquu7ggvYz13NBankKHVxXXuxFcxolb5Zhf8FvXI00PQfhQ3qv"
            },
            {
                "name": "STRIPE_SECRET_KEY",
                "value": "sk_test_51GrmhoDWiwaOszRRobZNnjTq9zqTWtFfxKlFHhcw7ODRa6J1sMFeO5Pc73tJsnwm7BTrcvySBSPBZO5SGEGdQEUM00yaHT1yZr"
            },
            {
                "name": "STRIPE_WEBHOOK_SECRET",
                "value": "whsec_2YHzzTvVuPkEXNUN0p2znkiO8uRfgEBv"
            },
            {
                "name": "TWILIO_ACC_SID",
                "value": "AC5cb8e959b7ee68e35fb6573737b44032"
            },
            {
                "name": "TWILIO_AUTH_TOKEN",
                "value": "02e2daa3db4bb3526461ec0a1faeabef"
            },
            {
                "name": "TWILIO_PHONE",
                "value": "+17158022429"
            },
            {
                "name": "CELERY_BROKER_URL",
                "value": "amqps://admin:678AHFGjkasf90KO@b-8ca6dfa0-d20d-4b2d-9db7-b54fe6a81899.mq.us-east-1.amazonaws.com:5671"
            },
            {
                "name": "MEMCACHED_LOCATION",
                "value": "clustervio-dev-cached.6nfhaw.cfg.use1.cache.amazonaws.com:11211"
            },
            {
                "name": "FIREBASE_ADMIN_BASE64_KEY",
                "value": "eyAgICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsICAgInByb2plY3RfaWQiOiAidmlvLXN0YWctZjUwZjAiLCAgICJwcml2YXRlX2tleV9pZCI6ICJiM2I1M2FhMDNiN2E3NWIwZDhmNzMwNTgwNjc0ZDg5ZjU2OGM4NWJlIiwgICAicHJpdmF0ZV9rZXkiOiAiLS0tLS1CRUdJTiBQUklWQVRFIEtFWS0tLS0tXG5NSUlFdmdJQkFEQU5CZ2txaGtpRzl3MEJBUUVGQUFTQ0JLZ3dnZ1NrQWdFQUFvSUJBUUNVSXRxNjlLam8yZ1B3XG5OelRPTzcrcXp2d2NGUS92VDZORGQ1TTFEd2lRaStyZ2g0a05xWS91ZFZkSHo4TlJGQS9tdjQ1eUZzTmxXdEJtXG5OZWcxZTlHby96TThYaXZHZ2VONlNZakxYbkRVRlFFdndpRkRkQ0V5MXhLdDE1V1I0bW1FUjlja0pKWVhxbklZXG5qTnVtSWtZU0FudktpbVNqVTNhZjU0dUFZRGhaSUlJWGtGZEcxNmhtb2ttZzA3Zkxsd1UzYnNDSzJmdEtvNGFmXG5ZMk94NTRKcmlaZFJxYkdIdXpaY0RRM2F1ZEcya2hPYmZvbWpoNFJyNi9VSmp2QzZoWTIwWks4WUxyeXc1bEhuXG5wZjhBb00yRmNUZXJ0ZDloVXpEMklBcS91OVNtMjZzU1RiK1l6VGQzSkp3M1haZXlnL2RVT2JwdVJmUDZYVnYxXG5Wb3JBSEFMakFnTUJBQUVDZ2dFQUNrc3B1OWdJYkxYSmxFV2h5N3JuSksxaFkyb3JRMHZiWW5MS3JlTXZpeXZOXG4xSEJXbTdadW8vbFBhVlFNbEhPNmJ5UmNkNTBSVXRldXA0dVRhVFFEYTZUZ0lJL0NwdmFib2dHK0diT2tUM2h1XG5McTFrdGxVNWdWamttV1BqcHRGKzE0eE9iTnFGKzNzQ2xxWWpGVFpJZkRQaitqMEhwVG5GZ25NS2hJOHJHelpHXG5BNGZJOFEveDl4V2x3Y1FTN2I5RG5VMjhEQjhlVmxBUmZZcndXczY1KzlHbnNmT1pMNno2WW83MlNibkR2ajh2XG5ldHpNUnNrUUVyVVJjUzRSK3ZXNFBzdFdWYlpqbVN1dVJnQUx1SGdSa1U0aEhBK2ZDY0c2cytTZStNd082YzZpXG5FZW9KcDl3VWZleFVMaFpvek1URyt1cTBCZlYxRW9mRkFQK1EyS1BoVVFLQmdRREM0WE5FNlRJMzF4QlQ5YTdjXG4yTjc4SFc5eE1IRWhmUE8yTElLMnozN3FZeFRYSWZ2ckN0d25vVlg3OCtyUEwzZ24wS0ZucTV5OTIza2dJTk1yXG5DV1hiZ1htalphQ3dMNUpWKzhUc0hXUmVXN3p1dE9SYVN0TTZHSytWb2EreUxBK25jYURiakYzREJTWU9IWEVyXG5HRGdOaHZHWVI1OC9lVkVJUDdORTNPMHEzd0tCZ1FEQ21HTXpYMGhuU0taRERXcUZuL1hvUFkrMGIwRjVtTFhJXG50b2taWkcxL0N3L3Q5NEVUeEYzZnBkY1FnNGY4SG1ERU53RW9nMERaQS9ZSENkQ2VaWG5vbGVENTMrOXpadkttXG44WHVSQU8zWU5Ob0pwL2NDWGt4eU9HNmNLYTZjUDFrQnI0S0hob3czZ2tBWVhYWERHMGFrck91TlFoenNDMmFGXG5YQnpSTE1oc2ZRS0JnUUNYV2FTK05pWHNQRGpRSEJTc0xEb3hyMktuazZtcENuUDBYZWsrdFRPcU1UMDBQNDU0XG40cnhNZ3Y1V2FQOUozV0lCK2dRQWtjVnZwZzRTSjZ3WTFubW0ybzF2bXpRSzRVZFRRKytTT05tRWR0YnF4TTQ4XG5XYlJtZ0ZtTmFqOGJyeUNST0t4bkZrS1RmV0lxd0M3dCt5YzlTanBEdkF3dnJiYURJNFhFeTVmZUhRS0JnUUM2XG51ZzJlMHhTZi8wZURXaEZZVGVsaXhBZnNaVUhYMDZERUM5dzg0SEJ0a3dqakdUZmo1dThKVjVLcWh2eHJBaDlxXG55VGswVGRaaEovcmlRQm5PbEtOSmV1Q2FCYmM0N3BWemVvOU8waXhvNWpZL1E4eXptaGNURjNHVUtpOGlRV3RBXG5RZEVvQ1FUdGt1KzhNWnA1OE9kMXgzUjBaUGRwelhyQUIyYWpsYXh3NVFLQmdIa1pzYndxUUpFSitKc21XZFpLXG5sMmFBdzlsbWtSSHRJOGY4VkRKK1cwNlFvYW5Ta2UyeFVTZWdnL3RCRjlGcFJFckdDQng2S1NyUzg5UnhsK3VFXG50MFprWUFuOTJqblRIS0FYTzZOY2R5UGM1UGZXeUU4VUZSYUIwLzdRL2hCMTVrT1dJTG1KcEhVdmswakp0TlYvXG5hdCtwTTA2OXovZ1lMdFYzaTg0NWVMWHBcbi0tLS0tRU5EIFBSSVZBVEUgS0VZLS0tLS1cbiIsICAgImNsaWVudF9lbWFpbCI6ICJmaXJlYmFzZS1hZG1pbnNkay1kYTdoc0B2aW8tc3RhZy1mNTBmMC5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsICAgImNsaWVudF9pZCI6ICIxMTQzNDg2MzU4MTIxNzIwNzU3OTQiLCAgICJhdXRoX3VyaSI6ICJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20vby9vYXV0aDIvYXV0aCIsICAgInRva2VuX3VyaSI6ICJodHRwczovL29hdXRoMi5nb29nbGVhcGlzLmNvbS90b2tlbiIsICAgImF1dGhfcHJvdmlkZXJfeDUwOV9jZXJ0X3VybCI6ICJodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9vYXV0aDIvdjEvY2VydHMiLCAgICJjbGllbnRfeDUwOV9jZXJ0X3VybCI6ICJodHRwczovL3d3dy5nb29nbGVhcGlzLmNvbS9yb2JvdC92MS9tZXRhZGF0YS94NTA5L2ZpcmViYXNlLWFkbWluc2RrLWRhN2hzJTQwdmlvLXN0YWctZjUwZjAuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iIH0="
            },
            {
                "name": "EMAIL_HOST",
                "value": "smtp.gmail.com"
            },
            {
                "name": "EMAIL_HOST_USER",
                "value": "prismtechinc.apptest@gmail.com"
            },
            {
                "name": "EMAIL_HOST_PASSWORD",
                "value": "pdtcrpqnqfxummwh"
            },
            {
                "name": "EMAIL_PORT",
                "value": "587"
            },
            {
                "name": "MACHINE_ID",
                "value": "1"
            }
        ],
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                "awslogs-group": "/ecs/${app_name}",
                "awslogs-region": "${aws_region}",
                "awslogs-stream-prefix": "ecs"
            }
        }
    }
]

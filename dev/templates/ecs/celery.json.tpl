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
                "value": "ewogICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsCiAgInByb2plY3RfaWQiOiAidmlvLXN0YWctZjUwZjAiLAogICJwcml2YXRlX2tleV9pZCI6ICJiM2I1M2FhMDNiN2E3NWIwZDhmNzMwNTgwNjc0ZDg5ZjU2OGM4NWJlIiwKICAicHJpdmF0ZV9rZXkiOiAiLS0tLS1CRUdJTiBQUklWQVRFIEtFWS0tLS0tCk1JSUV2Z0lCQURBTkJna3Foa2lHOXcwQkFRRUZBQVNDQktnd2dnU2tBZ0VBQW9JQkFRQ1VJdHE2OUtqbzJnUHcKTnpUT083K3F6dndjRlEvdlQ2TkRkNU0xRHdpUWkrcmdoNGtOcVkvdWRWZEh6OE5SRkEvbXY0NXlGc05sV3RCbQpOZWcxZTlHby96TThYaXZHZ2VONlNZakxYbkRVRlFFdndpRkRkQ0V5MXhLdDE1V1I0bW1FUjlja0pKWVhxbklZCmpOdW1Ja1lTQW52S2ltU2pVM2FmNTR1QVlEaFpJSUlYa0ZkRzE2aG1va21nMDdmTGx3VTNic0NLMmZ0S280YWYKWTJPeDU0SnJpWmRScWJHSHV6WmNEUTNhdWRHMmtoT2Jmb21qaDRScjYvVUpqdkM2aFkyMFpLOFlMcnl3NWxIbgpwZjhBb00yRmNUZXJ0ZDloVXpEMklBcS91OVNtMjZzU1RiK1l6VGQzSkp3M1haZXlnL2RVT2JwdVJmUDZYVnYxClZvckFIQUxqQWdNQkFBRUNnZ0VBQ2tzcHU5Z0liTFhKbEVXaHk3cm5KSzFoWTJvclEwdmJZbkxLcmVNdml5dk4KMUhCV203WnVvL2xQYVZRTWxITzZieVJjZDUwUlV0ZXVwNHVUYVRRRGE2VGdJSS9DcHZhYm9nRytHYk9rVDNodQpMcTFrdGxVNWdWamttV1BqcHRGKzE0eE9iTnFGKzNzQ2xxWWpGVFpJZkRQaitqMEhwVG5GZ25NS2hJOHJHelpHCkE0Zkk4US94OXhXbHdjUVM3YjlEblUyOERCOGVWbEFSZllyd1dzNjUrOUduc2ZPWkw2ejZZbzcyU2JuRHZqOHYKZXR6TVJza1FFclVSY1M0Uit2VzRQc3RXVmJaam1TdXVSZ0FMdUhnUmtVNGhIQStmQ2NHNnMrU2UrTXdPNmM2aQpFZW9KcDl3VWZleFVMaFpvek1URyt1cTBCZlYxRW9mRkFQK1EyS1BoVVFLQmdRREM0WE5FNlRJMzF4QlQ5YTdjCjJONzhIVzl4TUhFaGZQTzJMSUsyejM3cVl4VFhJZnZyQ3R3bm9WWDc4K3JQTDNnbjBLRm5xNXk5MjNrZ0lOTXIKQ1dYYmdYbWpaYUN3TDVKVis4VHNIV1JlVzd6dXRPUmFTdE02R0srVm9hK3lMQStuY2FEYmpGM0RCU1lPSFhFcgpHRGdOaHZHWVI1OC9lVkVJUDdORTNPMHEzd0tCZ1FEQ21HTXpYMGhuU0taRERXcUZuL1hvUFkrMGIwRjVtTFhJCnRva1paRzEvQ3cvdDk0RVR4RjNmcGRjUWc0ZjhIbURFTndFb2cwRFpBL1lIQ2RDZVpYbm9sZUQ1Mys5elp2S20KOFh1UkFPM1lOTm9KcC9jQ1hreHlPRzZjS2E2Y1Axa0JyNEtIaG93M2drQVlYWFhERzBha3JPdU5RaHpzQzJhRgpYQnpSTE1oc2ZRS0JnUUNYV2FTK05pWHNQRGpRSEJTc0xEb3hyMktuazZtcENuUDBYZWsrdFRPcU1UMDBQNDU0CjRyeE1ndjVXYVA5SjNXSUIrZ1FBa2NWdnBnNFNKNndZMW5tbTJvMXZtelFLNFVkVFErK1NPTm1FZHRicXhNNDgKV2JSbWdGbU5hajhicnlDUk9LeG5Ga0tUZldJcXdDN3QreWM5U2pwRHZBd3ZyYmFESTRYRXk1ZmVIUUtCZ1FDNgp1ZzJlMHhTZi8wZURXaEZZVGVsaXhBZnNaVUhYMDZERUM5dzg0SEJ0a3dqakdUZmo1dThKVjVLcWh2eHJBaDlxCnlUazBUZFpoSi9yaVFCbk9sS05KZXVDYUJiYzQ3cFZ6ZW85TzBpeG81alkvUTh5em1oY1RGM0dVS2k4aVFXdEEKUWRFb0NRVHRrdSs4TVpwNThPZDF4M1IwWlBkcHpYckFCMmFqbGF4dzVRS0JnSGtac2J3cVFKRUorSnNtV2RaSwpsMmFBdzlsbWtSSHRJOGY4VkRKK1cwNlFvYW5Ta2UyeFVTZWdnL3RCRjlGcFJFckdDQng2S1NyUzg5UnhsK3VFCnQwWmtZQW45MmpuVEhLQVhPNk5jZHlQYzVQZld5RThVRlJhQjAvN1EvaEIxNWtPV0lMbUpwSFV2azBqSnROVi8KYXQrcE0wNjl6L2dZTHRWM2k4NDVlTFhwCi0tLS0tRU5EIFBSSVZBVEUgS0VZLS0tLS0KIiwKICAiY2xpZW50X2VtYWlsIjogImZpcmViYXNlLWFkbWluc2RrLWRhN2hzQHZpby1zdGFnLWY1MGYwLmlhbS5nc2VydmljZWFjY291bnQuY29tIiwKICAiY2xpZW50X2lkIjogIjExNDM0ODYzNTgxMjE3MjA3NTc5NCIsCiAgImF1dGhfdXJpIjogImh0dHBzOi8vYWNjb3VudHMuZ29vZ2xlLmNvbS9vL29hdXRoMi9hdXRoIiwKICAidG9rZW5fdXJpIjogImh0dHBzOi8vb2F1dGgyLmdvb2dsZWFwaXMuY29tL3Rva2VuIiwKICAiYXV0aF9wcm92aWRlcl94NTA5X2NlcnRfdXJsIjogImh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL29hdXRoMi92MS9jZXJ0cyIsCiAgImNsaWVudF94NTA5X2NlcnRfdXJsIjogImh0dHBzOi8vd3d3Lmdvb2dsZWFwaXMuY29tL3JvYm90L3YxL21ldGFkYXRhL3g1MDkvZmlyZWJhc2UtYWRtaW5zZGstZGE3aHMlNDB2aW8tc3RhZy1mNTBmMC5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIKfQoK"
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
                "value": "MakeVioGreatAgain@21"
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

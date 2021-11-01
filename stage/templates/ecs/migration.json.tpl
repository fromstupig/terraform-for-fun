[
  {
      "name": "${app_name}",
      "image": "${app_image}",
      "cpu": ${fargate_cpu},
      "memory": ${fargate_memory},
      "networkMode": "awsvpc",
      "environment": [{
            "name": "POSTGRES_DB",
            "value": "vio"
        }, {
            "name": "POSTGRES_HOST",
            "value": "vio-db-stage.cwo3vdrnog4b.us-east-1.rds.amazonaws.com"
        },{
            "name": "POSTGRES_PASSWORD",
            "value": "3AAqBH2whM6TjAF"
        },{
            "name": "POSTGRES_USER",
            "value": "postgres"
        }, {
            "name": "ENV",
            "value": "PRODUCTION"
        }, {
            "name": "SECRET_KEY",
            "value": "^%c+#1wu+g(s&_2ybin4_w-r)39i5(%6)0y_d70q2vd4ip9y$%"
        },{
"name": "FIREBASE_DB_URL",
"value": "https://prismtech-inc-ios-release.firebaseio.com/"
}, {
"name": "FIREBASE_ADMIN_BASE64_KEY",
"value": "ewogICJ0eXBlIjogInNlcnZpY2VfYWNjb3VudCIsCiAgInByb2plY3RfaWQiOiAicHJpc210ZWNoLWluYy1pb3MtcmVsZWFzZSIsCiAgInByaXZhdGVfa2V5X2lkIjogImZlYmYzZjg3YzM2ZGFlOGM0YWM2NzkyYmRjYjcwNWZmYTA0ZWMzZmQiLAogICJwcml2YXRlX2tleSI6ICItLS0tLUJFR0lOIFBSSVZBVEUgS0VZLS0tLS1cbk1JSUV2UUlCQURBTkJna3Foa2lHOXcwQkFRRUZBQVNDQktjd2dnU2pBZ0VBQW9JQkFRQzcwWFpORFRhdW1Bb0pcbnpEN2w3Y3prUmY3dlNzNDhTQUJtLzdTakpmdEQ1V2J1KzFUd04vaUQwajRGZlRVcUtNbkdJdFVIMnBiaG1tcmpcbkMrbGZwRzVSbTdjbndUVXYxbUMzaDBobHVDaVJ3dTlpdkFqRmJuVU9BbkZobEUwN0JFMCtxUDQ5cVBQbXNPQVNcbmZIVzZyUjZzVUFhcHFyc0VEWWl4YWZGdWM1VE11NTQ3K1pRc0lFZFovYkx1T0wzYkNTREdMb2QycnhzY0JUaVdcbk1CTzVqcUlVTWdURkRlOGlNN2huZ0dZNG85WWx3VG1EOFlIb2RhYXRXZlVlc290QjcvbGJVbWNXeGdwSjZqN1Zcbkt6UnJlTStjLzdsbWw0RHZFZDVKRjRrZmVoYnFDbjFIVjhEd2xWaWNRbWh5WENJVlV1ZVBodmwxVUZFRllCZi9cbjdoMktoTXFOQWdNQkFBRUNnZ0VBSDFsQkhHL0Q3SVRpaWd1ZUJQMDUyWEVvY2RMajFQSjBwTHh4NzFoUDFkK1Vcbm5IZDFVQ29iY0E4M3ZHMVBZaVBRTitMSStXaGVEalphdUY1YzI5S2plam9hS2tmSW81MHQ0L3d2MUpDV0x1d2hcblRqTFI2UGc4ai9QTzdtbFZNYkJRWDFEUUxNVUdQcjlQaXk1Y2JTWG5ySDJuK3dwTThFcDlBaFhManpLNkI2alFcbkx2RVd5c3hSZ1JqR24rNlczNDdSV05uNWVWckJONDlQK1N6V1puS1V5TlpvZHNHdUxVZG5PcHAxRTl6MEJaVWhcbjl0K3p3UXZDT3YvZFlHMDdTYkpHL1RoalFBNjRYTU9LcStZTnFVamZ3TldUdHlZOVRMb1hLQkU1Zm1aS3ZRVStcbkdkaEtVMHBUQzg4ajRPVG92QkRqNDh2ZDh5YUtTWlBJVHZ5ZzMzVUEyUUtCZ1FEOXpxR1ZWdmJqS2NDeG9UaGNcbmw4SFJWQ1dQSDY4bVhpcGQ4OG03aUtKMUhGcDdvaFl5Zms5UDRCSHpydVo2eTMzWHBmQlptV2p3TUxPd1E5VTZcbkk1WG5ENGNlVnhZVVNEb0hTSTArbW1iblVEaEFta29qa1RJc2dlMzdzdkQ0T0hMSEFGb2hhZDlFQm43K21RR09cbmhESkgzZSt0Rm9IY1c0aEsrM0lQd0Z6eUpRS0JnUUM5Y09DSGRsWDVFYUJkQks1YldaKzlybmRDei9QOVVydU9cbnU1WDhSOXVrVHRnVm53WWJuMVVsZkNvVHVZNmxwb3F6czU0aTNoeTFUSXhVWUVQaHEwdU5KLzhFYk1WazZIckxcbmt5MGpmRk9qeTFwSEtTZWlaUTRsZDV0Qk1vWkY4R3lrU0wrYzRUbVFBUEJsUkdBQ1B3NVAzSkNPN3h3ZXdvVVVcblluZUJXSlZtU1FLQmdDKzdQVzRkZGI3UTZsazlqYUQwTlZJTnRpYU5lZDRJVllWbnhLZU5FYWhlbGJHc2tPb2NcbkVRUmZpbUMrb3IrekowNTMrWlNRSWtrUmo2bDFpRk12d0JBOVBsYjVYOENldUxNSDlQQXlEMm92RHZVdlR3UVRcbldWRS9laWNjeHU2WGh4WmZ2Wk9OR3B6cmI5U25wOEJLb2o0YndlaFdWRVBCdndjQzlMZDdvTDgxQW9HQkFMSDNcbjJQZHB0RnJJdEY2dWh4NUtsRWNlSCt3a2NKTUxwaWZ4RW5adkMyalFxUyttdFpZOW1VQWQ1V21pYU9BMkZSZTlcbkpsS2JWMXo3RE5vM2xZM3IzbzQ5aE5ZaldVM3pHV2ttV3NGN2l4ZlZjbnBucjFSZ20ybVhjOE5NTTlpQWhZL1FcbnlESVpaSHBrWjNLN1NYYlN4aDlBbG8yeEZEblJoRFFpVFNLMmxhUUJBb0dBWURWamZXU1RqRTF6MUs4dVJnbWZcblpuUTdOM2xrdUNUQXV5MzQzVmxaMTFTcndaUUNoSkhVa1pCamZBblN6UnRxcVVkN1YyalEvYVp1bUh4Q2FhanRcbmhQL0lnZFJLdFhkcHkrZ2ZxaUNBNGhMSE5lMTZyU0ErWXFQZUdMd1NwM1BNMFYxZkU5VVdsb1VoRUw5V3FOY3BcbmJQUDA2Mk1Hbm1SNVVPQlI1UXhHRDlNPVxuLS0tLS1FTkQgUFJJVkFURSBLRVktLS0tLVxuIiwKICAiY2xpZW50X2VtYWlsIjogImZpcmViYXNlLWFkbWluc2RrLW1wc2JzQHByaXNtdGVjaC1pbmMtaW9zLXJlbGVhc2UuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iLAogICJjbGllbnRfaWQiOiAiMTEyMjUyMzM1ODUwMjA3NTkzNzgyIiwKICAiYXV0aF91cmkiOiAiaHR0cHM6Ly9hY2NvdW50cy5nb29nbGUuY29tL28vb2F1dGgyL2F1dGgiLAogICJ0b2tlbl91cmkiOiAiaHR0cHM6Ly9vYXV0aDIuZ29vZ2xlYXBpcy5jb20vdG9rZW4iLAogICJhdXRoX3Byb3ZpZGVyX3g1MDlfY2VydF91cmwiOiAiaHR0cHM6Ly93d3cuZ29vZ2xlYXBpcy5jb20vb2F1dGgyL3YxL2NlcnRzIiwKICAiY2xpZW50X3g1MDlfY2VydF91cmwiOiAiaHR0cHM6Ly93d3cuZ29vZ2xlYXBpcy5jb20vcm9ib3QvdjEvbWV0YWRhdGEveDUwOS9maXJlYmFzZS1hZG1pbnNkay1tcHNicyU0MHByaXNtdGVjaC1pbmMtaW9zLXJlbGVhc2UuaWFtLmdzZXJ2aWNlYWNjb3VudC5jb20iCn0K"
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

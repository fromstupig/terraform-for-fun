import sys
import boto3 as boto3


def run(env='dev'):
    if env not in ['dev', 'stage', 'prod']:
        print('env is not valid')
        return

    client = boto3.client('ec2')
    security_groups = client.describe_security_groups(
        Filters=[
            {
                'Name': 'group-name',
                'Values': [
                    f'{env}-ecs-tasks-sg',
                ]
            },
        ],
    )

    security_group = security_groups['SecurityGroups'][0]
    security_group_id = security_group['GroupId']
    ecs_client = boto3.client('ecs', region_name='us-east-1')
    response = ecs_client.list_tasks(
        cluster=cluster,
    )
    first_task = response['taskArns'][0]
    resp = ecs_client.describe_tasks(
        cluster=cluster,
        tasks=[
            first_task,
        ],
    )
    task_detail_items = resp['tasks'][0]['attachments'][0]['details']
    subnet_id = None

    for task_detail_item in task_detail_items:
        if task_detail_item['name'] == 'subnetId':
            subnet_id = task_detail_item['value']
            break

    if security_group_id and subnet_id:
        resp = ecs_client.run_task(
            cluster=cluster,
            taskDefinition='vio-dbmigration-task',
            launchType='FARGATE',
            count=1,
            networkConfiguration={
                'awsvpcConfiguration': {
                    'subnets': [
                        subnet_id,
                    ],
                    'securityGroups': [
                        security_group_id,
                    ],
                }
            },
        )

    print(resp)


cluster = 'vio-cluster'
arg = sys.argv[1] or 'dev'
run(arg)

if [ "$#" -lt 2 ]; then
	echo "usage: "$0" <Image ID.> <Image name> <Version>"
	exit 1
fi 

REGION=<AWS region>
PROFILE=<Profile authorized to push images>
ACCOUNT=<AWS account id.>

set -x

aws --region $REGION ecr get-login-password --profile $PROFILE | docker login --username AWS --password-stdin $ACCOUNT.dkr.ecr.$REGION.amazonaws.com

docker tag $1 $ACCOUNT.dkr.ecr.$REGION.amazonaws.com/$2:$3

docker push $ACCOUNT.dkr.ecr.$REGION.amazonaws.com/$2:$3


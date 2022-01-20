#!/bin/bash

export RESOURCE_GROUP="Template_Specs_RG"
export LOCATION="East US"
export VERSION="1.0"

echo "Deploying template specs..."
echo "Resource Group: $RESOURCE_GROUP"
echo "Location:       $LOCATION"
echo "Version:        $VERSION"

RGP=$(az group create -l $LOCATION -n $RESOURCE_GROUP)
echo "Resource group $RESOURCE_GROUP created/updated"

RESPONSE=$(az ts create \
    --name "TestGithubAction" \
    --display-name "TestGithubAction" \
    --description "Test github actions" \
    --version $VERSION \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION \
    --template-file "./django-app/component.json" \
    --yes\
    --query 'id' -o json)
    
echo "Done: $RESPONSE"
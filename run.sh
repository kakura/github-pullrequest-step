#!/bin/bash

if [ ! -n "${WERCKER_GITHUB_PULLREQUEST_USER}" ]; then
  error 'Please specify user property'
  exit 1
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQUEST_REPOSITORY}" ]; then
  error 'Please specify repository property'
  exit 1
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQUEST_TOKEN}" ]; then
  error 'Please specify token property'
  exit 1
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQUEST_TITLE}" ]; then
  error 'Please specify title property'
  exit 1
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQUEST_FROM}" ]; then
  FROM='master'
else
  FROM=${WERCKER_GITHUB_PULLREQUEST_FROM}
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQUEST_TO}" ]; then
  TO='develop'
else
  TO=${WERCKER_GITHUB_PULLREQUEST_TO}
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQUEST_BODY}" ]; then
  BODY='Please check this pull request.'
else
  BODY=${WERCKER_GITHUB_PULLREQUEST_BODY}
fi


USER=${WERCKER_GITHUB_PULLREQUEST_USER}
REPOSITORY=${WERCKER_GITHUB_PULLREQUEST_REPOSITORY}
TOKEN=${WERCKER_GITHUB_PULLREQUEST_TOKEN}
TITLE=${WERCKER_GITHUB_PULLREQUEST_TITLE}


curl -u "${USER}:${TOKEN}" -d '{"title": "${TITLE}","body": "${BODY}","head": "${USER}:${FROM}","base": "${TO}"}'  https://api.github.com/repos/${USER}/${REPOSITORY}/pulls

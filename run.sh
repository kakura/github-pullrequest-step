#!/bin/bash

if [ ! -n "${WERCKER_GITHUB_PULLREQUEST_USER}" ]; then
  error 'Please specify user property'
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
  FROM=${WERCKER_GIT_BRANCH}
else
  FROM=${WERCKER_GITHUB_PULLREQUEST_FROM}
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQUEST_TO}" ]; then
  TO='master'
else
  TO=${WERCKER_GITHUB_PULLREQUEST_TO}
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQUEST_BODY}" ]; then
  BODY='Please check this pull request.'
else
  BODY=${WERCKER_GITHUB_PULLREQUEST_BODY}
fi


USER=${WERCKER_GITHUB_PULLREQUEST_USER}
REPOSITORY=${WERCKER_GIT_REPOSITORY}
TOKEN=${WERCKER_GITHUB_PULLREQUEST_TOKEN}
TITLE=${WERCKER_GITHUB_PULLREQUEST_TITLE}

echo ${USER}
echo ${REPOSITORY}
echo ${TOKEN}
echo ${TITLE}
echo ${BODY}
echo ${FROM}
echo ${TO}

url=https://api.github.com/repos/${WERCKER_GIT_OWNER}/${REPOSITORY}/pulls
data="{\"title\":\"${TITLE}\",\"body\":\"${BODY}\",\"head\":\"${USER}:${FROM}\",\"base\":\"${TO}\"}"
echo ${url}
echo ${data}

curl -u "${USER}:${TOKEN}" -d "${data}" ${url}

#!/bin/bash

$WERCKER_GITHUB_PULLREQEST_USER
$WERCKER_GITHUB_PULLREQEST_REPOSITORY
$WERCKER_GITHUB_PULLREQEST_TOKEN
$WERCKER_GITHUB_PULLREQEST_TITLE
$WERCKER_GITHUB_PULLREQEST_BODY
$WERCKER_GITHUB_PULLREQEST_FROM
$WERCKER_GITHUB_PULLREQEST_TO

if [ ! -n "${WERCKER_GITHUB_PULLREQEST_USER}" ]; then
  error 'Please specify user property'
  exit 1
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQEST_REPOSITORY}" ]; then
  error 'Please specify repository property'
  exit 1
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQEST_TOKEN}" ]; then
  error 'Please specify token property'
  exit 1
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQEST_TITLE}" ]; then
  error 'Please specify title property'
  exit 1
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQEST_FROM}" ]; then
  FROM='master'
else
  FROM=${WERCKER_GITHUB_PULLREQEST_FROM}
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQEST_TO}" ]; then
  TO='develop'
else
  TO=${WERCKER_GITHUB_PULLREQEST_TO}
fi

if [ ! -n "${WERCKER_GITHUB_PULLREQEST_BODY}" ]; then
  BODY='Please check this pull request.'
else
  BODY=${WERCKER_GITHUB_PULLREQEST_BODY}
fi


USER=${WERCKER_GITHUB_PULLREQEST_USER}
REPOSITORY=${WERCKER_GITHUB_PULLREQEST_REPOSITORY}
TOKEN=${WERCKER_GITHUB_PULLREQEST_TOKEN}
TITLE=${WERCKER_GITHUB_PULLREQEST_TITLE}


curl -u "${USER}:${TOKEN}" -d '{"title": "${TITLE}","body": "${BODY}","head": "${USER}:${FROM}","base": "${TO}"}'  https://api.github.com/repos/${USER}/${REPOSITORY}/pulls

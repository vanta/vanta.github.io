#!/bin/bash
token=`./csrf_get.sh`
echo "CSRF token: $token"

captcha=`./recaptcha_solve.sh`
echo "Captcha: $captcha"
./single_vote.sh $token $captcha

captcha=`./recaptcha_solve.sh`
echo "Captcha: $captcha"
./single_vote.sh $token $captcha

captcha=`./recaptcha_solve.sh`
echo "Captcha: $captcha"
./single_vote.sh $token $captcha

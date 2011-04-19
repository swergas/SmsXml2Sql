#!/bin/sh
# usage : ./script smsdump.xml > dump.sql
xsltproc sms_template.xsl $1

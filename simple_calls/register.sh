#!/bin/sh

SIPP=$(which sipp)
SIPP_LOCAL_PORT=5061
SIPP_HOST=localhost
REGISTER_CSV=register.csv
REGISTER_XML=register.xml
REGISTER_INTERVAL=90

REGISTER_COUNT=$(cat ${REGISTER_CSV} | grep -v -e "SEQ" -e "RAN" -e "USER" -e "#" | wc -l)

while [ true ]
do
	sipp -sf ${REGISTER_XML} -inf ${REGISTER_CSV}  -r ${REGISTER_COUNT}  -m ${REGISTER_COUNT} -p ${SIPP_LOCAL_PORT}  ${SIPP_HOST} && sleep ${REGISTER_INTERVAL} || break
done


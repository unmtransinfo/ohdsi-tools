#!/bin/sh
#############################################################################
# OMOP CDM, Common Data Model
#############################################################################
#
DB="omop_cdm"
DBHOST="localhost"
DBUSR="jjyang"
#
SRCDATADIR="/home/data/ohdsi"
DATADIR="data"
#
createdb $DB
#
#
#Filename spaces problematic.
###
ddl_sqlfile="$DATADIR/omop_cdm_ddl_pg.sql"
cat $SRCDATADIR/CommonDataModel-master/PostgreSQL/*CDM*ddl*PostgreSQL.sql \
	>$ddl_sqlfile
psql -d $DB -f $ddl_sqlfile
#
###
constraints_sqlfile="$DATADIR/omop_cdm_constraints_pg.sql"
cat $SRCDATADIR/CommonDataModel-master/PostgreSQL/*CDM*constraints*PostgreSQL.sql \
	>$constraints_sqlfile
psql -d $DB -f $constraints_sqlfile
#

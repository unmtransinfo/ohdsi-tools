#!/bin/sh
#############################################################################
# OMOP CDM standardized vocabularies
#############################################################################
#
DB="omop"
DBHOST="localhost"
DBUSR="jjyang"
#
#DATADIR="data"
DATADIR="/home/data/ohdsi"
#
createdb $DB
#
psql -d $DB -c "COMMENT ON DATABASE $DB IS 'OMOP CDM standardized vocabulary mappings (ICD9CM, ICD10CM, ICD10, SNOMED)'"
#
csvfiles="\
$DATADIR/DOMAIN.csv \
$DATADIR/VOCABULARY.csv \
$DATADIR/CONCEPT_CLASS.csv \
$DATADIR/RELATIONSHIP.csv \
$DATADIR/CONCEPT.csv \
$DATADIR/CONCEPT_RELATIONSHIP.csv \
$DATADIR/CONCEPT_ANCESTOR.csv \
$DATADIR/CONCEPT_SYNONYM.csv \
"
#
#
for csvfile in $csvfiles ; do
	#
	sqlfile_create="${csvfile}_create.sql"
	sqlfile_insert="${csvfile}_insert.sql"
	#
	csv2sql.py \
		--i $csvfile \
		--tsv \
		--create \
		--fixtags \
		|psql -d $DB -f $sqlfile_create
	#
	csv2sql.py \
		--i $csvfile \
		--tsv \
		--insert \
		--fixtags \
		|psql -q -d $DB -f $sqlfile_insert
	#
done
#
###
#psql -d $DB -c "COMMENT ON TABLE concept IS 'OHDSI concept table'";
#
#psql -d $DB -c "UPDATE soc SET text = NULL WHERE text = ''";
#

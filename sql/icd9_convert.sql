--
SELECT
	c1.concept_name AS "concept1",
	c1.concept_code AS "ICD9CM",
	cr1.relationship_id AS "relationship1",
	c2.concept_name AS "concept2",
	c2.concept_code AS "SNOMED",
	cr2.relationship_id AS "relationship2",
	c3.concept_name AS "concept3",
	c3.concept_code AS "ICD10CM"
FROM
	concept c1
JOIN
	concept_relationship cr1 ON c1.concept_id = cr1.concept_id_1
JOIN
	concept c2 ON c2.concept_id = cr1.concept_id_2
JOIN
	concept_relationship cr2 ON c2.concept_id = cr2.concept_id_1
JOIN
	concept c3 ON c3.concept_id = cr2.concept_id_2
WHERE
	c1.concept_name ILIKE '%gout%'
	AND c1.vocabulary_id = 'ICD9CM'
	AND c2.vocabulary_id = 'SNOMED'
	AND c3.vocabulary_id = 'ICD10CM'
	;
--

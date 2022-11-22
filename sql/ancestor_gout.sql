--
SELECT
	c1.concept_name AS "concept_ICD9CM",
	c1.concept_code AS "ICD9CM",
	cr1.relationship_id AS "relationship1",
	c2.concept_name AS "concept_SNOMED",
	c2.concept_code AS "SNOMED",
	c3.concept_name AS "concept_SNOMED_ancestor",
	c3.concept_code AS "SNOMED_ancestor"
FROM
	concept c1
JOIN
	concept_relationship cr1 ON c1.concept_id = cr1.concept_id_1
JOIN
	concept c2 ON c2.concept_id = cr1.concept_id_2
JOIN
	concept_ancestor ca ON ca.descendant_concept_id = c2.concept_id
JOIN
	concept c3 ON c3.concept_id =  ca.ancestor_concept_id
WHERE
	c1.concept_name ILIKE '%gout%'
	AND c1.vocabulary_id = 'ICD9CM'
	AND c2.vocabulary_id = 'SNOMED'
	AND c3.vocabulary_id = 'SNOMED'
ORDER BY
	c1.concept_code
	;
--

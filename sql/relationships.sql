--
SELECT
	COUNT(cr.relationship_id),
	cr.relationship_id,
	r.relationship_concept_id
FROM
	concept_relationship cr,
	relationship r
WHERE
	cr.relationship_id = r.relationship_id
GROUP BY
	cr.relationship_id,
	r.relationship_concept_id
	;
--
SELECT
	COUNT(cr.relationship_id),
	c.vocabulary_id
FROM
	concept c,
	concept_relationship cr
WHERE
	c.concept_id = cr.concept_id_1
GROUP BY
	c.vocabulary_id
ORDER BY
	c.vocabulary_id
	;
--
SELECT
	COUNT(cr.relationship_id),
	c.vocabulary_id,
	cr.relationship_id
FROM
	concept c,
	concept_relationship cr
WHERE
	c.concept_id = cr.concept_id_1
GROUP BY
	c.vocabulary_id,
	cr.relationship_id
ORDER BY
	c.vocabulary_id,
	cr.relationship_id
	;
--

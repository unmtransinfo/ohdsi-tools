--
SELECT
	COUNT(c1.concept_id),
	c1.vocabulary_id
FROM
	concept c1
GROUP BY
	c1.vocabulary_id
	;
--

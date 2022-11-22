SELECT
        * 
FROM 
        concept c,
	concept_ancestor ca
WHERE
	c.concept_id = ca.descendant_concept_id
        AND ca.ancestor_concept_id IN ('436665')
	;

/*
Table racing stores information about racers attempting different segments of a racing track.

racer_id	attempt_id	segment_id	time
87	         10	         2	      12.057
14	         8	         1	      13.003
14	         9	         1	      13.001
22	         2	         2	      12.870
87	        12	         3	      25.156
56	         1	         1	      12.897
56	         2	         2      	11.994
22	         4         	 2	      12.908
14	        10	         2	      13.007
14	        11	         1	      12.997
87	        13	         3	      25.422
For every racer and segment find minimum time. Apply ordering starting from fastest attempts.
*/

SELECT 
    racer_id,
    segment_id,
    MIN(time) AS "minimum time"
FROM
    racing
GROUP BY
    racer_id,
    segment_id
ORDER BY
    MIN(time);

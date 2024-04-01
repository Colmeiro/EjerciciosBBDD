SELECT * FROM MOVIES; /* #1 */

SELECT * FROM genres; /* #2 */

SELECT * FROM STUDIOS WHERE studio_active = 1; /* #3*/

SELECT * FROM members ORDER BY MEMBER_DISCHARGE_DATE DESC LIMIT 10; /* #4 */


SELECT * 
FROM (
		SELECT MOVIES.MOVIE_DURATION, COUNT(*) AS REGISTROS_REPETIDOS 
		FROM MOVIES
		GROUP BY MOVIES.MOVIE_DURATION
		ORDER BY REGISTROS_REPETIDOS DESC
		LIMIT 20)
ORDER BY MOVIE_DURATION DESC; /* #5 */

SELECT *
FROM (
SELECT MOVIE_NAME AS NOMBRE, YEAR (MOVIE_LAUNCH_DATE) AS ESTRENO
FROM MOVIES
)
WHERE ESTRENO >= 2000 AND NOMBRE LIKE 'A%' ; /* #6 */

SELECT * FROM ACTORS;

SELECT *  
FROM ACTORS
WHERE MONTH (ACTOR_BIRTH_DATE) = 6; /* #7*/

SELECT *  
FROM ACTORS
WHERE MONTH (ACTOR_BIRTH_DATE) != 6
AND ACTOR_DEAD_DATE IS NOT NULL ; /* #8*/

SELECT NOMBRE, EDAD
FROM (SELECT DIRECTOR_NAME AS NOMBRE, DIRECTOR_DEAD_DATE, DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, CURRENT_DATE) AS EDAD
	  FROM directors)
WHERE EDAD <= 50 AND DIRECTOR_DEAD_DATE IS NULL; /* #9 */

SELECT NOMBRE, EDAD
FROM (SELECT DIRECTOR_NAME AS NOMBRE, DIRECTOR_DEAD_DATE, DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, CURRENT_DATE) AS EDAD
	  FROM directors)
WHERE EDAD < 50 AND DIRECTOR_DEAD_DATE IS NOT NULL; /* #10 */

SELECT NOMBRE, EDAD
FROM (SELECT DIRECTOR_NAME AS NOMBRE, DIRECTOR_DEAD_DATE, DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, CURRENT_DATE) AS EDAD
	  FROM directors)
WHERE EDAD <= 40 AND DIRECTOR_DEAD_DATE IS NULL; /* #11 */

SELECT AVG(DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, CURRENT_DATE)) AS MEDIA
FROM (
	SELECT *
	FROM DIRECTORS
	WHERE DIRECTOR_DEAD_DATE IS NULL
); /* #12 */

SELECT * FROM pekerjaan ORDER BY gaji DESC;
DESC pekerjaan;
DELIMITER //
CREATE PROCEDURE GetBanyakGaji (
    -> IN tNIP INT(5),
    -> OUT tBanyakGaji VARCHAR(10))
    -> BEGIN
    -> DECLARE BanyakGaji VARCHAR(10);
    -> SELECT GAJI
    -> INTO BanyakGaji
    -> FROM pekerjaan
    -> WHERE NIP = tNIP;
    -> CASE BanyakGaji
    -> WHEN BanyakGaji >= 850000 THEN
    -> SET tBanyakGaji = 'RENDAH';
    -> WHEN BanyakGaji >= 1500000 THEN
    -> SET tBanyakGaji = 'SEDANG';
    -> WHEN BanyakGaji >= 2000000 THEN
    -> SET tBanyakGaji = 'TINGGI';
    -> ELSE
    -> SET tBanyakGaji = 'TIDAK DIKETAHUI';
    -> END CASE;
    -> END //
DELIMITER ;
CALL GetBanyakGaji(750000, @BanyakGaji);
SELECT @BanyakGaji;
CALL GetBanyakGaji(900000, @BanyakGaji);
SELECT @BanyakGaji; 

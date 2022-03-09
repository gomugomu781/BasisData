USE mysql;
SHOW tables;
SELECT * FROM offices;
DESC offices;
DELIMITER //
CREATE PROCEDURE GetBenuaKantor (
    -> IN pKodeKantor VARCHAR(10),
    -> OUT pBenuaKantor VARCHAR(10))
    -> BEGIN
    -> DECLARE BenuaKantor VARCHAR(20);
    -> SELECT country
    -> INTO BenuaKantor
    -> FROM offices
    -> WHERE officeCode = pKodeKantor;
    -> CASE BenuaKantor
    -> WHEN 'USA' THEN
    -> SET pBenuaKantor = 'AMERICA';
    -> WHEN 'France' THEN
    -> SET pBenuaKantor = 'EUROPE';
    -> WHEN 'Japan' THEN
    -> SET pBenuaKantor = 'ASIA';
    -> WHEN 'Australia' THEN
    -> SET pBenuaKantor = 'AUSTRALIA';
    -> ELSE
    -> SET pBenuaKantor = 'EUROPE';
    -> END CASE;
    -> END //
DELIMITER ;
CALL GetBenuaKantor(3, @benua);
SELECT @benua;
CALL GetBenuaKantor(4, @benua)
SELECT @benua;


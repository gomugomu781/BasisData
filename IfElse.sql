USE mysql;
SHOW tables;
SELECT * FROM pelanggan;
DESC pelanggan;
DELIMITER //
CREATE PROCEDURE MembuatLevelKredit (
-> IN tNoPelanggan VARCHAR(10),
-> OUT tLevelKredit VARCHAR(10))
-> BEGIN
-> DECLARE TingkatKredit INT(20);
-> SELECT KreditLimit
-> INTO TingkatKredit
-> FROM pelanggan
-> WHERE NoPelanggan = tNoPelanggan;
-> IF TingkatKredit > 100000 THEN
-> SET tLevelKredit = 'TINGGI';
-> ELSEIF TingkatKredit >= 50000 THEN
-> SET tLevelKredit = 'MEDIUM';
-> ELSE
-> SET tLevelKredit = 'RENDAH';
-> END IF;
-> END //
DELIMITER ;
CALL MembuatLevelKredit(448, @limit);
SELECT @limit;
CALL MembuatLevelKredit(112, @limit);
SELECT @limit;
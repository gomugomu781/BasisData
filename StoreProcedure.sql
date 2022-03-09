SHOW databases;
USE materi1dbsem4;
SHOW tables;
SELECT * FROM matakuliah;
SELECT * FROM DOSEN;
SELECT dosen.nama_dos, matakuliah.sks, matakuliah.semester
FROM DOSEN 
INNER JOIN matakuliah ON
dosen.kode_dos = matakuliah.kode_dos
WHERE semester = 5 OR semester = 6;
DELIMITER //
CREATE PROCEDURE ShowMK()
    -> BEGIN
    -> SELECT dosen.nama_dos, matakuliah.sks, matakuliah.semester
    -> FROM dosen
    -> INNER JOIN matakuliah ON
    -> dosen.kode_dos = matakuliah.kode_dos
    -> WHERE semester = 5 OR semester = 6;
    -> END //
DELIMITER ;
CALL ShowMK();
USE materidb;
SHOW tables;
SELECT * FROM produk;
SELECT * FROM produk WHERE jenis = 'Motorcycles';
SELECT * FROM produk WHERE jenis = 'Motorcycles' AND hargabeli < 62;
DELIMITER //
CREATE PROCEDURE MotorMurah()
    -> BEGIN
    -> select * from produk where jenis = 'motorcycles' and hargabeli < 62;
    -> END //
DELIMITER ;
CALL MotorMurah();


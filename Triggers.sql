USE materidb;
SHOW tables;
SELECT * FROM tbpasien;
CREATE TABLE pasien_audit (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> nama VARCHAR(50) NOT NULL,
    -> jeniskelamin VARCHAR(50) NOT NULL,
    -> waktuaudit DATETIME DEFAULT NULL,
    -> keterangan VARCHAR(50) DEFAULT NULL
    -> );
CREATE TRIGGER before_pasien_update
    -> BEFORE UPDATE ON tbpasien
    -> FOR EACH ROW
    -> INSERT INTO pasien_audit
    -> SET keterangan = 'audit',
    -> jeniskelamin = OLD.jenis_kelamin,
    -> waktuaudit = NOW();
UPDATE tbpasien
    -> SET nama_pasien = 'Johan Nugroho', jenis_kelamin = 'Laki-laki'
    -> WHERE id_pasien = 'PA001';
SELECT * FROM pasien_audit;


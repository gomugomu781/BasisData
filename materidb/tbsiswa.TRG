TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER before_siswa_insert\nBEFORE INSERT\nON tbsiswa FOR EACH ROW\nBEGIN\nDECLARE jumlahsiswa INT;\nSELECT COUNT(*)\nINTO jumlahsiswa\nFROM tbjumlahsiswa;\nIF jumlahsiswa > 0 THEN \nUPDATE tbjumlahsiswa\nSET jumlahsiswa = jumlahsiswa + new.capacity;\nELSE \nINSERT INTO tbjumlahsiswa(jumlahsiswa)\nVALUES(new.capacity);\nEND IF;\nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='cp850'
connection_cl_names='cp850_general_ci'
db_cl_names='utf8mb4_general_ci'
created=164649115458

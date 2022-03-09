TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER before_dokter_audit\nBEFORE UPDATE ON tbdokter\nFOR EACH ROW\nINSERT INTO\ndokter_audit\nSET keterangan = \'audit\',\nspesialis = OLD.spesialis,\nwaktuaudit = NOW()'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='cp850'
connection_cl_names='cp850_general_ci'
db_cl_names='utf8mb4_general_ci'
created=164644904124

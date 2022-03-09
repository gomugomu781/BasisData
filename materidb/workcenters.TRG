TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER before_workcenters_insert\nBEFORE INSERT\nON WorkCenters FOR EACH ROW\nBEGIN\nDECLARE rowcount INT;\nSELECT COUNT(*) \nINTO rowcount\nFROM WorkCenterStats;\nIF rowcount > 0 THEN\nUPDATE WorkCenterStats\nSET totalCapacity = totalCapacity + new.capacity;\nELSE\nINSERT INTO WorkCenterStats(totalCapacity)\nVALUES(new.capacity);\nEND IF; \nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='cp850'
connection_cl_names='cp850_general_ci'
db_cl_names='utf8mb4_general_ci'
created=164649057342

  MEMBER('TRANS_NOMBRE.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('TRANS_NOMBRE_BC0.CLW')
TRANS_NOMBRE_BC0:DctInit             PROCEDURE()
TRANS_NOMBRE_BC0:DctKill             PROCEDURE()
TRANS_NOMBRE_BC0:FilesInit           PROCEDURE()
    END
  END

DctInit PROCEDURE()
  CODE
  TRANS_NOMBRE_BC0:DctInit
  TRANS_NOMBRE_BC0:FilesInit


DctKill PROCEDURE()
  CODE
  TRANS_NOMBRE_BC0:DctKill

